import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zulhijaya_task_project/services/api.dart';

class AuthAPI {
  Future login({String? email, String? password}) async {
    final data = {
      'email': email,
      'password': password,
    };

    try {
      final res = await API().client().post('/auth/login', data: data);
      return res;
    } on DioError catch (e) {
      debugPrint(e.message);
      // throw ApiException(e);
    }
  }
}
