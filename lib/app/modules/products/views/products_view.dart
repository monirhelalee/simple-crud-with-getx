import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_crud_with_getx/app/core/resource/colors.dart';
import 'package:simple_crud_with_getx/app/modules/products/views/widgets/product_card_widget.dart';

import '../../../routes/app_pages.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
        leading: InkWell(
          onTap: () {
            Get.toNamed(Routes.PROFILE);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppTheme.darkBlueColor,
                borderRadius: BorderRadius.circular(50)),
            child: const Icon(Icons.person_2_outlined),
          ),
        ),
      ),
      body: _productsCardWidget(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.primaryColor,
          onPressed: () {
            Get.toNamed(Routes.ADD_PRODUCT);
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget _productsCardWidget() => Obx(() => controller.isLoading.value
      ? const Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 1 / 1.5,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.productsList.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PRODUCT_DETAILS, arguments: {
                        "Product": controller.productsList[index]
                      });
                    },
                    child: ProductCardWidget(
                      imageAssetPath:
                          controller.productsList[index].brand?.image,
                      productTitle: controller.productsList[index].name,
                      price: controller.productsList[index].productPrice?.price,
                      brandName: controller.productsList[index].brand?.name,
                      onTap: () async {
                        await controller.deleteProduct(
                            productId: controller.productsList[index].id);
                      },
                    ),
                  );
                }),
          ),
        ));
}
