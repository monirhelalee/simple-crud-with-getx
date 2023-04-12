import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/localdb/hive_service.dart';
import '../../../core/service/api_service.dart';
import '../../../data/models/products_data_model.dart';

class ProductsController extends GetxController {
  final productsList = <ProductsDataModel>[].obs;
  final isLoading = false.obs;
  final HiveService hiveService = HiveService();

  getProductList() async {
    isLoading.value = true;
    bool exists = await hiveService.isExists<List<ProductsDataModel>>(
        boxName: "ProductsDataList");
    try {
      await ApiServiceHandler.get(
          "https://secure-falls-43052.herokuapp.com/api/products?page=0&size=20",
          onSuccess: (response) async {
        log("-->$response");
        var data = jsonEncode(response.data);
        productsList.value = productsDataModelFromJson(data);
        await hiveService.addBoxes<List<ProductsDataModel>>(
            productsList.value, "ProductsDataList");
        isLoading.value = false;
      }, onError: (error) async {
        if (exists) {
          productsList.value = await hiveService.getBoxes("ProductsDataList");
          debugPrint("product from offline ->${productsList.value.length}");
        }
        isLoading.value = false;
        log("-->$error");
        Get.snackbar("Error!", "Something wrong, please try again.");
      });
    } catch (e) {
      isLoading.value = false;
      if (exists) {
        productsList.value = await hiveService.getBoxes("ProductsDataList");
        debugPrint("product from offline ->${productsList.value.length}");
      }
    }
  }

  deleteProduct({String? productId}) async {
    Map<String, dynamic> body = {};
    await ApiServiceHandler.delete(
        "https://secure-falls-43052.herokuapp.com/api/products/$productId",
        body, onSuccess: (response) async {
      await getProductList();
      Get.snackbar("Delete!", "Delete successfully.");
    }, onError: (error) {
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
