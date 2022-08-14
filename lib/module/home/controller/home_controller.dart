

import 'package:agify_getx_demo/model/age_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/api_helper.dart';
import '../../../utils/loader.dart';

class HomeController extends GetxController{

 late TextEditingController nameController;
 final _apiHelper = Get.find<ApiHelper>();
 Rx<AgeResponse> ageDetails =
     AgeResponse().obs;


  @override
  void onInit() {
    super.onInit();
    nameController =  TextEditingController();

  }

  @override
  void onClose() {

    nameController.dispose();
    super.onClose();
  }

  void submit(){
    print('asdasdas');
    if(nameController.text.isEmpty){
      Get.snackbar(
        'Enter name',
        'Name is required',
        snackPosition: SnackPosition.BOTTOM,
      );
    }else{

      _apiHelper.getApiCall(nameController.text).then(
            (response) {
          if (response?.statusCode == 200) {
            AgeResponse responseData = ageResponseFromJson(response!.body);
            if (responseData.age == null) {
            Get.snackbar('Wrong Name', 'Enter a new first name',snackPosition: SnackPosition.BOTTOM, );
            }else{
              ageDetails.value = responseData;
            }
          }
        },
      );
    }

  }
}