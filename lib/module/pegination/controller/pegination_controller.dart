import 'package:agify_getx_demo/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/post_response.dart';
import '../../../services/api_helper.dart';

class PeginationController extends GetxController {
  final _apiHelper = Get.find<ApiHelper>();

  //RxL<PostResponse> postDetails = PostResponse().obs;
  //RxList<PostResponse> postDetails = RxList();
  //var postDetails = <PostResponse>[].obs;
  RxList<PostResponse> postDetails = (List<PostResponse>.of([])).obs;

  // RxList<PostResponse> postDetails = List<PostResponse>[].obs;

  var isLoadingMore = false.obs;
  final users = <PostResponse>[].obs;
  final posts = <PostResponse>[].obs;
  final scrollController = ScrollController();
  int page = 1;

  DBHelper? dbHelper;

  @override
  void onInit() async {
    scrollController.addListener(_scrollListner);
    await getMorePost();
    dbHelper = DBHelper();
    DBHelper.database();
    posts.value = (await dbHelper?.getItems())!;
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    scrollController.removeListener(_scrollListner);
    super.onInit();
  }

  Future<void> _scrollListner() async {
    if (isLoadingMore.value) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;

      isLoadingMore.value = true;

      await getMorePost();

      isLoadingMore.value = false;
    }
  }

  Future<void> getMorePost() async {
    isLoadingMore.value = true;
    await _apiHelper.getPost(page).then(
      (response) async {
        if (response?.statusCode == 200) {
          postDetails.value = postResponseFromJson(response!.body);
          users.addAll(postDetails.value);

          for (final movie in postDetails.value) {
            await DBHelper.insertDB(PostResponse(
                title: movie.title, body: movie.body, id: movie.id));
          }
          if (dbHelper?.getItems() != null) {
            posts.value = (await dbHelper?.getItems())!;
          }

          isLoadingMore.value = false;
        }
      },
    );
  }
}
