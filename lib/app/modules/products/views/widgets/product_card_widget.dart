import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_crud_with_getx/app/core/resource/colors.dart';

import '../../controllers/products_controller.dart';

class ProductCardWidget extends GetView<ProductsController> {
  final String? imageAssetPath;
  final String? productTitle;
  final String? price;
  final String? brandName;
  final VoidCallback? onTap;

  const ProductCardWidget({
    Key? key,
    this.imageAssetPath,
    this.productTitle,
    this.price,
    this.brandName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 141,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffEBF0FF),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// product image
              CachedNetworkImage(
                imageUrl: imageAssetPath ?? "",
                placeholder: (context, url) => const Center(
                  child: Icon(
                    Icons.image,
                    size: 100,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.image,
                    size: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              /// product name
              Text(
                productTitle ?? "---",
                maxLines: 2,
                style: GoogleFonts.poppins(
                  height: 1.3,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff223263),
                ),
              ),

              /// product price
              Text(
                "Tk$price",
                style: GoogleFonts.poppins(
                  height: 1.3,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff40BFFF),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Brand: ",
                        style: GoogleFonts.poppins(
                          height: 1.3,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkBlueColor,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          "$brandName",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            height: 1.3,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.darkBlueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: onTap,
                    child: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                      size: 18,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
