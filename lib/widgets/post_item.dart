import 'package:agify_getx_demo/module/pegination/controller/pegination_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/post_response.dart';

class PostItem extends GetView<PeginationController> {
  final PostResponse movie;

  PostItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(movie.id.toString()),
      title: Text(movie.title.toString()),
      subtitle: Text(movie.body.toString()),
    );
  }
}
