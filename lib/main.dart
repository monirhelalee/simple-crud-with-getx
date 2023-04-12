import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/service/api_service.dart';
import 'app/routes/app_pages.dart';

void main() {
  ApiServiceHandler();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
