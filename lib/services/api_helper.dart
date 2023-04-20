import 'dart:io';
import 'package:agify_getx_demo/constant/api_constant.dart';
import 'package:agify_getx_demo/constant/app_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart';

import '../utils/loader.dart';


class ApiHelper {
  void _errorHandler(Response response) {
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
      '╟ REQUEST ║ ${response.request?.method.toUpperCase()}\n'
      '╟ url: ${response.request?.url}\n'
      '╟ Headers: ${response.request?.headers}\n'
      '╟ Body: ${response.bodyBytes.map((event) => event.toString())}\n'
      '╟ Status Code: ${response.statusCode}\n'
      '╟ Data: ${response.body.toString()}'
      '\n╚══════════════════════════ Response ══════════════════════════\n',
      wrapWidth: 1024,
    );

    if (response.statusCode == 200) {
      return;
    }
  }

  Future<Response?> postApiCall(
      String urlEndPoint, Map<String, String> requestMap) async {

    Response? response;
    try {
      response = await post(
        Uri.parse(baseUrl + urlEndPoint),
        body: requestMap,
      );
      // To remove the loader.
      Get.back();
      _errorHandler(response);
    } on SocketException {
      // To remove the loader.
      Get.back();
      Get.snackbar(cNetworkError, cNetworkErrorDetails);
    }
    return response;
  }

  Future<Response?> getApiCall(String urlEndPoint) async {
    Response? response;
    try {
      Loader().showLoadingWidget();
      response = await get(
        Uri.parse(baseUrl + endPoint + urlEndPoint),
      );
      Get.back();
      _errorHandler(response);
    } on SocketException {
      //Get.back();
      Get.snackbar(cNetworkError, cNetworkErrorDetails);
    }
    return response;
  }

  Future<Response?> getPost(int pageNum) async {
    Response? response;

    try {

      response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=$pageNum&_limit=10'),
      );

      _errorHandler(response);
    } on SocketException {
      Get.snackbar(cNetworkError, cNetworkErrorDetails);
    }

    return response;
  }
}
