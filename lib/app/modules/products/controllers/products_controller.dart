import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../core/service/api_service.dart';
import '../../../data/models/products_data_model.dart';

class ProductsController extends GetxController {
  final productsList = <ProductsDataModel>[].obs;
  final isLoading = false.obs;

  getProductList() async {
    isLoading.value = true;
    var box = await Hive.openBox("ProductsDataList");
    try {
      await ApiServiceHandler.get(
          "https://secure-falls-43052.herokuapp.com/api/products?page=0&size=20",
          onSuccess: (response) async {
        log("-->$response");
        var data = jsonEncode(response.data);
        productsList.value = productsDataModelFromJson(data);
        box.deleteAll(box.keys);
        box.put("ProductsDataList", productsList.value);
        isLoading.value = false;
      }, onError: (error) async {
        var a = await box.get("ProductsDataList");
        List<ProductsDataModel> b = List<ProductsDataModel>.from(a);
        productsList.value = b;
        box.close();
        debugPrint("product from offline ->${productsList.value.length}");

        isLoading.value = false;
        log("-->$error");
        Get.snackbar("Error!", "Something wrong, please try again.");
      });
    } catch (e) {
      var a = await box.get("ProductsDataList");
      List<ProductsDataModel> b = List<ProductsDataModel>.from(a);
      productsList.value = b;
      box.close();
      isLoading.value = false;
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
