import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resource/colors.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<ProductDetailsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Obx(() => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      controller.product.value.brand?.image ?? "",
                      height: Get.width / 2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(controller.product.value.name ?? "",
                      style: GoogleFonts.poppins(
                        height: 1.3,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkBlueColor,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${controller.product.value.productPrice?.price ?? "0"} Tk",
                    style: GoogleFonts.poppins(
                      height: 1.3,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Specification",
                    style: GoogleFonts.poppins(
                      height: 1.3,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.darkBlueColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Brand: ",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.greyColor,
                        ),
                      ),
                      Text(
                        controller.product.value.brand?.name ?? "-",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.darkBlueColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Description: ",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.greyColor,
                        ),
                      ),
                      Text(
                        controller.product.value.description ?? "-",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.darkBlueColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Category: ",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.greyColor,
                        ),
                      ),
                      Text(
                        controller.product.value.subCategory?.category?.name ??
                            "-",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.darkBlueColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Sub-Category: ",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.greyColor,
                        ),
                      ),
                      Text(
                        controller.product.value.subCategory?.name ?? "-",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.darkBlueColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
