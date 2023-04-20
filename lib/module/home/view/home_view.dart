import 'package:agify_getx_demo/constant/app_theme.dart';
import 'package:agify_getx_demo/module/home/controller/home_controller.dart';
import 'package:agify_getx_demo/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {

  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Age'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(' Enter your name'),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blueAccent, //this has no effect
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter First Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButtonText(
                buttonText: 'Submit',
                onPressed: controller.submit,
                buttonHorizontalPadding: 0,
                buttonPadding: 10,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Text(
                  'Your Age is :-',
                  style: TextStyle(fontSize: 14, color: AppTheme.kBlack),
                ),
                Obx(
                      ()  =>
                   Text(
                       (controller.ageDetails.value.age !=null) ?controller.ageDetails.value.age.toString():"0",
                    style: const  TextStyle(fontSize: 25, color: AppTheme.kDarkBlue),
                  ),
                )
              ],
            ),
            Center(
              child: ElevatedButtonText(
                buttonText: 'Next Page',
                onPressed: controller.nextPage,
                buttonHorizontalPadding: 0,
                buttonPadding: 10,
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: ElevatedButtonText(
                buttonText: 'Open Camera',
                onPressed: controller.openCamera,
                buttonHorizontalPadding: 0,
                buttonPadding: 10,
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
