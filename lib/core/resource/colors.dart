import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff40BFFF);
  static const MaterialColor primarySwatchColor = MaterialColor(
    0xff40BFFF,
    <int, Color>{
      50: Color(0xff40BFFF),
      100: Color(0xff40BFFF),
      200: Color(0xff40BFFF),
      300: Color(0xff40BFFF),
      400: Color(0xff40BFFF),
      500: Color(0xff40BFFF),
      600: Color(0xff40BFFF),
      700: Color(0xff40BFFF),
      800: Color(0xff40BFFF),
      900: Color(0xff40BFFF),
    },
  );
  static const Color primaryColorConst = Color(0xff40BFFF);
  static const Color redColor = Color(0xffFB7181);
  static const Color yellowColor = Color(0xffFFC833);
  static const Color greenColor = Color(0xff53D1B6);
  static const Color purpleColor = Color(0xff5C61F4);
  static const Color greyColor = Color(0xff9098B1);
  static const Color darkBlueColor = Color(0xff223263);
  static const Color lightColor = Color(0xffEBF0FF);
  static final ThemeData primaryTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    textTheme: const TextTheme(
        bodyText2: TextStyle(
      color: Colors.black,
    )),
    primarySwatch: primarySwatchColor,
    unselectedWidgetColor: greyColor,
  );
}
