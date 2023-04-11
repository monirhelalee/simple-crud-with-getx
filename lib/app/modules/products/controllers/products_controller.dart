import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/service/api_service.dart';
import '../../../core/service/token_repo.dart';
import '../../../data/models/products_data_model.dart';
import '../../../routes/app_pages.dart';

class ProductsController extends GetxController {
  final tokenRepo = TokenRepo();
  final productsList = <ProductsDataModel>[].obs;
  final isLoading = false.obs;

  onLogOut() async {
    await tokenRepo.setToken("");
    Get.offAndToNamed(Routes.LOGIN);
  }

  getProductList() async {
    isLoading.value = true;
    await ApiServiceHandler.get(
        "https://secure-falls-43052.herokuapp.com/api/products?page=0&size=20",
        onSuccess: (response) {
      log("-->$response");
      var data = jsonEncode(response.data);
      productsList.value = productsDataModelFromJson(data);
      isLoading.value = false;
    }, onError: (error) {
      isLoading.value = false;
      log("-->$error");
      Get.snackbar("Error!", "Something wrong, please try again.");
    });
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProductList();
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
