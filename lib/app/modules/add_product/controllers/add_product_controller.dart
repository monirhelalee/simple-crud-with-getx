import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController mrpPriceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
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
