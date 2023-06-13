import 'package:agify_getx_demo/constant/app_theme.dart';
import 'package:agify_getx_demo/model/age_response.dart';
import 'package:agify_getx_demo/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../services/api_helper.dart';

class HomeController extends GetxController {
  late TextEditingController nameController;
  final _apiHelper = Get.find<ApiHelper>();

  Rx<AgeResponse> ageDetails = AgeResponse().obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void submit() {
    if (kDebugMode) {
      print('Age is clicked');
    }

    if (nameController.text.isEmpty) {
      Get.snackbar(
        'Enter name',
        'Name is required',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      loading.value = true;
      _apiHelper.getApiCall(nameController.text).then(
        (response) {
          loading.value = false;
          if (response?.statusCode == 200) {
            AgeResponse responseData = ageResponseFromJson(response!.body);
            if (responseData.age == null) {
              Get.snackbar('Wrong Name', 'Enter a new first name',
                  snackPosition: SnackPosition.TOP,
                  colorText: AppTheme.kBlack,
                  backgroundColor: AppTheme.kOpaqueOrange);
            } else {
              ageDetails.value = responseData;
            }
          }
        },
      );
    }
  }

  void nextPage() {
    Get.toNamed(Routes.PEGINATION_PAGE);
  }

  void openCamera() {
    Get.toNamed(Routes.CAMERA_SCREEN);
  }
}
