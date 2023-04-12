import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/products_data_model.dart';

class ProductDetailsController extends GetxController {
  //TODO: Implement ProductDetailsController

  final product = ProductsDataModel().obs;
  var argument = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    product.value = argument["Product"];
    debugPrint("test print ${product.value}");
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
