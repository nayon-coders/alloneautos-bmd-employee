// To parse this JSON data, do
//
//     final saleryModel = saleryModelFromJson(jsonString);

import 'dart:convert';

SaleryModel saleryModelFromJson(String str) => SaleryModel.fromJson(json.decode(str));

String saleryModelToJson(SaleryModel data) => json.encode(data.toJson());

class SaleryModel {
  final bool? success;
  final String? message;
  final String? totalEarningsHours;
  final double? totalAmount;
  final double? totalPayment;
  final double? dueAmount;
  final List<PaymentDetails>? data;

  SaleryModel({
    this.success,
    this.message,
    this.totalEarningsHours,
    this.totalAmount,
    this.totalPayment,
    this.dueAmount,
    this.data,
  });

  factory SaleryModel.fromJson(Map<String, dynamic> json) => SaleryModel(
    success: json["success"],
    message: json["message"],
    totalEarningsHours: json["totalEarningsHours"],
    totalAmount: json["totalAmount"]?.toDouble(),
    totalPayment: json["totalPayment"]?.toDouble(),
    dueAmount: json["dueAmount"]?.toDouble(),
    data: json["data"] == null ? [] : List<PaymentDetails>.from(json["data"]!.map((x) => PaymentDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalEarningsHours": totalEarningsHours,
    "totalAmount": totalAmount,
    "totalPayment": totalPayment,
    "dueAmount": dueAmount,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PaymentDetails {
  final int? id;
  final String? employeeId;
  final String? amount;
  final String? payBy;
  final String? checkNo;
  final String? date;
  final int? busnId;
  final String? salaryRate;
  final String? employeeName;

  PaymentDetails({
    this.id,
    this.employeeId,
    this.amount,
    this.payBy,
    this.checkNo,
    this.date,
    this.busnId,
    this.salaryRate,
    this.employeeName,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
    id: json["id"],
    employeeId: json["employeeID"],
    amount: json["amount"],
    payBy: json["payBy"],
    checkNo: json["check_no"],
    date: json["date"].toString(),
    busnId: json["busn_id"],
    salaryRate: json["salaryRate"],
    employeeName: json["employeeName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeID": employeeId,
    "amount": amount,
    "payBy": payBy,
    "check_no": checkNo,
    "date": date,
    "busn_id": busnId,
    "salaryRate": salaryRate,
    "employeeName": employeeName,
  };
}
