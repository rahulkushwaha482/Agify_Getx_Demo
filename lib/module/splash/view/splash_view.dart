
import 'package:agify_getx_demo/module/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController>{
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return const  SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding:  EdgeInsets.all(40.0),
            child: Text(
              'Guess Your Age',
              style: TextStyle(
                fontSize: 24,
                color: Colors.lightGreen
              ),
            )
          ),
        ),
      ),
    );
  }


}