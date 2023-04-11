import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/service/api_service.dart';
import '../../../core/service/token_repo.dart';
import '../../../data/models/login_data_model.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var passwordFocus = FocusNode();

  final loginDataModel = LoginDataModel().obs;
  final accessToken = "".obs;
  final isLoading = false.obs;
  final tokenRepo = TokenRepo();

  navigate() async {
    accessToken.value = await tokenRepo.getToken() ?? "";
    if (accessToken.value == "") {
    } else {
      Get.offAndToNamed(Routes.PRODUCTS);
    }
  }

  onLogin() async {
    Map<String, dynamic> body = {
      "username": emailController.text,
      "password": passwordController.text,
      "rememberMe": true
    };
    isLoading.value = true;
    await ApiServiceHandler.post(
        "https://secure-falls-43052.herokuapp.com/api/authenticate", body,
        onSuccess: (response) async {
      //debugPrint(response);
      //loginDataModel.value = loginDataModelFromJson(response.toString());
      String token = response["id_token"];
      await tokenRepo.setToken(token);
      isLoading.value = false;
      Get.offAndToNamed(Routes.PRODUCTS);
    }, onError: (error) {
      isLoading.value = false;
      log("-->$error");
      Get.snackbar("Error!", "Something wrong, please try again.");
    });
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    await tokenRepo.getToken();
    await navigate();
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
