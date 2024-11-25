

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/camera_controller.dart';

class CameraView extends GetView<CameraController>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom ListView'),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index){
           if (index % 3 == 2) {
          return const ListTile(
            title: Text('Ad'),
          );
        } else {
          final newIndex = (index * 2 / 3).ceil();
          return ListTile(
            title: Text('Item #$newIndex'),
          );
        }
      },itemCount: 40, )

    );
  }

}