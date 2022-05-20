import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zulhijaya_task_project/services/auth.dart';

class APIException implements Exception {
  final DioError error;

  APIException(this.error) {
    if (error.response?.statusCode == 401) {
      Auth.clearToken();
      Get.toNamed('/');
    } else {
      debugPrint(error.response?.statusCode.toString());
    }
  }
}
