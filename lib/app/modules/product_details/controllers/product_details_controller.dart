import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  //TODO: Implement ProductDetailsController

  final product = Rxn<dynamic>();
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
