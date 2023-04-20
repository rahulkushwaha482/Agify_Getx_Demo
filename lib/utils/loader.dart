import 'package:agify_getx_demo/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Loader {
  static final Loader _instance = Loader._internal();

  factory Loader() {
    return _instance;
  }

  Loader._internal();

  // Removal of this loading widget has been done at api_helper.dart.
  Future<dynamic> showLoadingWidget() => showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (context) => Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white.withOpacity(.85),
            ),
            width: 75,
            height: 75,
            child: const CircularProgressIndicator(
              strokeWidth: 1.5,
              semanticsLabel: 'Loading',
              valueColor: AlwaysStoppedAnimation<Color>(
                AppTheme.kDarkBlue,
              ),
            ),
          ),
        ),
      );
}
