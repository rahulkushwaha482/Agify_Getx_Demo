

import 'package:get/get.dart';

import '../controller/pegination_controller.dart';

class PeginationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PeginationController>(
          () => PeginationController(),
    );
  }

}