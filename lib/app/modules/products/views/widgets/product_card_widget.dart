import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_crud_with_getx/app/core/resource/colors.dart';

class ProductCardWidget extends StatelessWidget {
  final String? imageAssetPath;
  final String? productTitle;
  final String? price;
  final String? brandName;

  const ProductCardWidget(
      {Key? key,
      this.imageAssetPath,
      this.productTitle,
      this.price,
      this.brandName})
      : super(key: key);

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
              Image.network(
                imageAssetPath!,
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
                  const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 18,
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
