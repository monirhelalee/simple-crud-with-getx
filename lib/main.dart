import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'app/core/service/api_service.dart';
import 'app/data/models/products_data_model.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  ApiServiceHandler();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsDataModelAdapter());
  Hive.registerAdapter(BrandAdapter());
  Hive.registerAdapter(ProductPriceAdapter());
  Hive.registerAdapter(QuantityAdapter());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
