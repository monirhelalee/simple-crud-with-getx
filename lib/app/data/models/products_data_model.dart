// To parse this JSON data, do
//
//     final productsDataModel = productsDataModelFromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';

part 'products_data_model.g.dart';

List<ProductsDataModel> productsDataModelFromJson(String str) =>
    List<ProductsDataModel>.from(
        json.decode(str).map((x) => ProductsDataModel.fromJson(x)));

String productsDataModelToJson(List<ProductsDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 10)
class ProductsDataModel {
  ProductsDataModel({
    this.id,
    this.name,
    this.barcode,
    this.description,
    this.subCategory,
    this.brand,
    this.quantity,
    this.productPrice,
    this.image,
  });

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? barcode;
  @HiveField(3)
  String? description;
  @HiveField(4)
  Brand? subCategory;
  @HiveField(5)
  Brand? brand;
  @HiveField(6)
  Quantity? quantity;
  @HiveField(7)
  ProductPrice? productPrice;
  @HiveField(8)
  String? image;

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) =>
      ProductsDataModel(
        id: json["id"]?.toString(),
        name: json["name"],
        barcode: json["barcode"],
        description: json["description"],
        subCategory: json["subCategory"] == null
            ? null
            : Brand.fromJson(json["subCategory"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        quantity: json["quantity"] == null
            ? null
            : Quantity.fromJson(json["quantity"]),
        productPrice: json["productPrice"] == null
            ? null
            : ProductPrice.fromJson(json["productPrice"]),
        image: json["image"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "barcode": barcode,
        "description": description,
        "subCategory": subCategory?.toJson(),
        "brand": brand?.toJson(),
        "quantity": quantity?.toJson(),
        "productPrice": productPrice?.toJson(),
        "image": image,
      };
}

@HiveType(typeId: 11)
class Brand {
  Brand({
    this.id,
    this.name,
    this.description,
    this.image,
    this.category,
  });
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? image;
  @HiveField(4)
  Brand? category;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"]?.toString(),
        name: json["name"],
        description: json["description"],
        image: json["image"],
        category:
            json["category"] == null ? null : Brand.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "category": category?.toJson(),
      };
}

@HiveType(typeId: 12)
class ProductPrice {
  ProductPrice({
    this.id,
    this.price,
    this.unitPrice,
    this.mrp,
  });

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? price;
  @HiveField(2)
  String? unitPrice;
  @HiveField(3)
  String? mrp;

  factory ProductPrice.fromJson(Map<String, dynamic> json) => ProductPrice(
        id: json["id"]?.toString(),
        price: json["price"]?.toString(),
        unitPrice: json["unitPrice"]?.toString(),
        mrp: json["mrp"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "unitPrice": unitPrice,
        "mrp": mrp,
      };
}

@HiveType(typeId: 13)
class Quantity {
  Quantity({
    this.id,
    this.quantity,
    this.unit,
    this.unitValue,
    this.pastQuantity,
  });
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? quantity;
  @HiveField(2)
  String? unit;
  @HiveField(3)
  String? unitValue;
  @HiveField(4)
  String? pastQuantity;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        id: json["id"]?.toString(),
        quantity: json["quantity"]?.toString(),
        unit: json["unit"]?.toString(),
        unitValue: json["unitValue"]?.toString(),
        pastQuantity: json["pastQuantity"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "unit": unit,
        "unitValue": unitValue,
        "pastQuantity": pastQuantity,
      };
}
