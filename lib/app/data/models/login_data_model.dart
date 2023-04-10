// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromJson(jsonString);

import 'dart:convert';

LoginDataModel loginDataModelFromJson(String str) =>
    LoginDataModel.fromJson(json.decode(str));

String loginDataModelToJson(LoginDataModel data) => json.encode(data.toJson());

class LoginDataModel {
  LoginDataModel({
    this.idToken,
  });

  String? idToken;

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        idToken: json["id_token"],
      );

  Map<String, dynamic> toJson() => {
        "id_token": idToken,
      };
}
