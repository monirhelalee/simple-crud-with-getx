import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/resource/colors.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProductView'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: const Center(
        child: Text(
          'AddProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
