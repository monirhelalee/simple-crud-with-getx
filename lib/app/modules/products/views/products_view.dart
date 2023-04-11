import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        actions: [
          IconButton(
            onPressed: () async {
              await controller.onLogOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: _productsCardWidget(),
    );
  }

  Widget _productsCardWidget() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 1 / 1.5,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PRODUCT_DETAILS,
                        arguments: {"Product": "test"});
                  },
                  child: ProductCardWidget(
                    icon: Icons.ac_unit,
                    productTitle: "Nike Air Max 270 React ENG",
                  ),
                );
              }),
        ),
      );
}
