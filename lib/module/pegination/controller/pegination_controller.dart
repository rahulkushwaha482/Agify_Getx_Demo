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
  final scrollController = ScrollController();
  int page = 1;

  @override
  void onInit() {
    scrollController.addListener(_scrollListner);
    getMorePost();
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
      (response) {
        if (response?.statusCode == 200) {
          postDetails.value = postResponseFromJson(response!.body);
          users.addAll(postDetails.value);
          isLoadingMore.value = false;
        }
      },
    );
  }
}
