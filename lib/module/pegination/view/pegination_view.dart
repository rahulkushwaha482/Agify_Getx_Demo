import 'package:agify_getx_demo/module/pegination/controller/pegination_controller.dart';
import 'package:agify_getx_demo/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PeginationView extends GetView<PeginationController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          centerTitle: true,
        ),
        body:  Obx(() {
            return (controller.posts.isEmpty)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index < controller.posts.length) {
                        return PostItem(controller.posts[index]);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    //separatorBuilder: (context, index) => Divider(),
                    itemCount: (controller.isLoadingMore.value)
                        ? controller.posts.length + 1
                        : controller.posts.length,
              controller: controller.scrollController,
                  );
          }
        ));
  }
}
