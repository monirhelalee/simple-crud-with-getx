import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_crud_with_getx/app/core/resource/colors.dart';

class ProductCardWidget extends StatelessWidget {
  final String? imageAssetPath;
  final String? productTitle;
  final String? offerPrice;
  final String? mainPrice;
  final String? discount;
  final IconData? icon;
  const ProductCardWidget(
      {Key? key,
      this.imageAssetPath,
      this.productTitle,
      this.offerPrice,
      this.mainPrice,
      this.discount,
      this.icon})
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
              // Image.asset(
              //   imageAssetPath!,
              // ),
              Center(
                child: Icon(
                  icon,
                  size: 100,
                  color: AppTheme.primaryColor,
                ),
              ),

              /// product name
              Text(
                productTitle ?? "Nike Air Max 270 React ENG",
                style: GoogleFonts.poppins(
                  height: 1.3,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff223263),
                ),
              ),

              /// product price
              Text(
                "Tk299.43",
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
                  /// product actual price with line through
                  Text(
                    "Tk534.33",
                    style: GoogleFonts.poppins(
                      height: 1.3,
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),

                  /// product discount percentage
                  Text(
                    "24% Off",
                    style: GoogleFonts.poppins(
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
