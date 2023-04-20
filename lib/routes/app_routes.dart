part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const PEGINATION_PAGE = _Paths.PEGINATION_PAGE;
  static const CAMERA_SCREEN = _Paths.CAMERA_SCREEN;


}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const PEGINATION_PAGE = '/pegination';
  static const CAMERA_SCREEN = '/camera';

}