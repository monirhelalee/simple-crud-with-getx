// To parse this JSON data, do
//
//     final profileDataModel = profileDataModelFromJson(jsonString);

import 'dart:convert';

ProfileDataModel profileDataModelFromJson(String str) =>
    ProfileDataModel.fromJson(json.decode(str));

String profileDataModelToJson(ProfileDataModel data) =>
    json.encode(data.toJson());

class ProfileDataModel {
  ProfileDataModel({
    this.id,
    this.login,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.imageUrl,
    this.activated,
    this.langKey,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.authorities,
  });

  int? id;
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? imageUrl;
  bool? activated;
  String? langKey;
  String? createdBy;
  dynamic createdDate;
  String? lastModifiedBy;
  DateTime? lastModifiedDate;
  List<String>? authorities;

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataModel(
        id: json["id"],
        login: json["login"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        imageUrl: json["imageUrl"],
        activated: json["activated"],
        langKey: json["langKey"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedDate: json["lastModifiedDate"] == null
            ? null
            : DateTime.parse(json["lastModifiedDate"]),
        authorities: json["authorities"] == null
            ? []
            : List<String>.from(json["authorities"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "imageUrl": imageUrl,
        "activated": activated,
        "langKey": langKey,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedDate": lastModifiedDate?.toIso8601String(),
        "authorities": authorities == null
            ? []
            : List<dynamic>.from(authorities!.map((x) => x)),
      };
}
