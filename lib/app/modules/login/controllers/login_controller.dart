import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/service/api_service.dart';
import '../../../data/models/login_data_model.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var passwordFocus = FocusNode();

  final loginDataModel = LoginDataModel().obs;

  final dio = Dio();

  onLogin() async {
    Map<String, dynamic> body = {
      "username": "admin",
      "password": "admin",
      "rememberMe": true
    };
    await ApiServiceHandler.post(
        "https://secure-falls-43052.herokuapp.com/api/authenticate", body,
        onSuccess: (response) {
      loginDataModel.value = loginDataModelFromJson(response);
      debugPrint("${loginDataModel.value.idToken}");
    }, onError: (error) {
      ApiServiceHandler.exceptionHandler(error);
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    ApiServiceHandler();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
