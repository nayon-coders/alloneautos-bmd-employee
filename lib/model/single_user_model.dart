// To parse this JSON data, do
//
//     final singleUserModel = singleUserModelFromJson(jsonString);

import 'dart:convert';

SingleUserModel singleUserModelFromJson(String str) => SingleUserModel.fromJson(json.decode(str));

String singleUserModelToJson(SingleUserModel data) => json.encode(data.toJson());

class SingleUserModel {
  final int? id;
  final int? businessId;
  final String? businessName;
  final String? businessAddress;
  final String? name;
  final String? email;
  final String? password;
  final int? emailPin;
  final String? phone;
  final String? type;
  final String? salaryType;
  final String? salaryRate;

  SingleUserModel({
    this.id,
    this.businessId,
    this.businessName,
    this.businessAddress,
    this.name,
    this.email,
    this.password,
    this.emailPin,
    this.phone,
    this.type,
    this.salaryType,
    this.salaryRate,
  });

  factory SingleUserModel.fromJson(Map<String, dynamic> json) => SingleUserModel(
    id: json["id"],
    businessId: json["business_id"],
    businessName: json["business_name"],
    businessAddress: json["business_address"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    emailPin: json["emailPin"],
    phone: json["phone"],
    type: json["type"],
    salaryType: json["salaryType"],
    salaryRate: json["salaryRate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "business_name": businessName,
    "business_address": businessAddress,
    "name": name,
    "email": email,
    "password": password,
    "emailPin": emailPin,
    "phone": phone,
    "type": type,
    "salaryType": salaryType,
    "salaryRate": salaryRate,
  };
}
