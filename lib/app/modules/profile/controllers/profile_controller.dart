import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/service/api_service.dart';
import '../../../core/service/token_repo.dart';
import '../../../data/models/profile_data_model.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final tokenRepo = TokenRepo();
  final profileData = ProfileDataModel().obs;
  final isLoading = false.obs;

  getProfileData() async {
    isLoading.value = true;
    await ApiServiceHandler.get(
        "https://secure-falls-43052.herokuapp.com/api/account",
        onSuccess: (response) {
      log("-->$response");
      var data = jsonEncode(response.data);
      profileData.value = profileDataModelFromJson(data);
      isLoading.value = false;
    }, onError: (error) {
      isLoading.value = false;
      log("-->$error");
      Get.snackbar("Error!", "Something wrong, please try again.");
    });
  }

  onLogOut() async {
    await tokenRepo.setToken("");
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfileData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
