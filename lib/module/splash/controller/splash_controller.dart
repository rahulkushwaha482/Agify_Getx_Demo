import 'package:agify_getx_demo/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1500)).then(

      (value) {
        Get.offNamed(Routes.HOME);
      },
    );
  }
}
