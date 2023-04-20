import 'package:agify_getx_demo/module/splash/binding/splash_binding.dart';
import 'package:agify_getx_demo/module/splash/view/splash_view.dart';
import 'package:get/get.dart';
import '../module/camera_screen/binding/camera_binding.dart';
import '../module/camera_screen/view/camere_view.dart';
import '../module/home/binding/home_binding.dart';
import '../module/home/view/home_view.dart';
import '../module/pegination/binding/pegination_binding.dart';
import '../module/pegination/view/pegination_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PEGINATION_PAGE,
      page: () => PeginationView(),
      binding: PeginationBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_SCREEN,
      page: () => CameraView(),
      binding: CameraBinding(),
    ),
  ];
}
