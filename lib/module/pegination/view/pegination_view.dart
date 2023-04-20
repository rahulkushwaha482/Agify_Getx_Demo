import 'package:agify_getx_demo/module/pegination/controller/pegination_controller.dart';
import 'package:agify_getx_demo/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PeginationView extends GetView<PeginationController> {
  int pageNum = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          centerTitle: true,
        ),
        body:  Obx(() {
            return (controller.users.isEmpty)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index < controller.users.length) {
                        return PostItem(controller.users[index]);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    //separatorBuilder: (context, index) => Divider(),
                    itemCount: (controller.isLoadingMore.value)
                        ? controller.users.length + 1
                        : controller.users.length,
              controller: controller.scrollController,
                  );
          }
        ));
  }
}
