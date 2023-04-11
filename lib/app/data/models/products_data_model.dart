// To parse this JSON data, do
//
//     final productsDataModel = productsDataModelFromJson(jsonString);

import 'dart:convert';

List<ProductsDataModel> productsDataModelFromJson(String str) =>
    List<ProductsDataModel>.from(
        json.decode(str).map((x) => ProductsDataModel.fromJson(x)));

String productsDataModelToJson(List<ProductsDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  String? id;
  String? name;
  String? barcode;
  String? description;
  Brand? subCategory;
  Brand? brand;
  Quantity? quantity;
  ProductPrice? productPrice;
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

class Brand {
  Brand({
    this.id,
    this.name,
    this.description,
    this.image,
    this.category,
  });

  String? id;
  String? name;
  String? description;
  String? image;
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

class ProductPrice {
  ProductPrice({
    this.id,
    this.price,
    this.unitPrice,
    this.mrp,
  });

  String? id;
  String? price;
  String? unitPrice;
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

class Quantity {
  Quantity({
    this.id,
    this.quantity,
    this.unit,
    this.unitValue,
    this.pastQuantity,
  });

  String? id;
  String? quantity;
  String? unit;
  String? unitValue;
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
