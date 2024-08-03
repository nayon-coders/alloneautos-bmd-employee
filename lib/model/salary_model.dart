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
  final dynamic totalAmount;
  final int? totalPayment;
  final dynamic dueAmount;
  final List<AmountDatum>? amountData;

  SaleryModel({
    this.success,
    this.message,
    this.totalEarningsHours,
    this.totalAmount,
    this.totalPayment,
    this.dueAmount,
    this.amountData,
  });

  factory SaleryModel.fromJson(Map<String, dynamic> json) => SaleryModel(
    success: json["success"],
    message: json["message"],
    totalEarningsHours: json["totalEarningsHours"],
    totalAmount: json["totalAmount"],
    totalPayment: json["totalPayment"],
    dueAmount: json["dueAmount"],
    amountData: json["amountData"] == null ? [] : List<AmountDatum>.from(json["amountData"]!.map((x) => AmountDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalEarningsHours": totalEarningsHours,
    "totalAmount": totalAmount,
    "totalPayment": totalPayment,
    "dueAmount": dueAmount,
    "amountData": amountData == null ? [] : List<dynamic>.from(amountData!.map((x) => x.toJson())),
  };
}

class AmountDatum {
  final int? id;
  final int? employeeId;
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? date;
  final String? totalHours;
  final String? salaryRate;
  final String? amount;
  final int? busnId;

  AmountDatum({
    this.id,
    this.employeeId,
    this.startTime,
    this.endTime,
    this.date,
    this.totalHours,
    this.salaryRate,
    this.amount,
    this.busnId,
  });

  factory AmountDatum.fromJson(Map<String, dynamic> json) => AmountDatum(
    id: json["id"],
    employeeId: json["employeeID"],
    startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
    endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    totalHours: json["total_hours"],
    salaryRate: json["salaryRate"],
    amount: json["amount"],
    busnId: json["busn_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeID": employeeId,
    "start_time": startTime?.toIso8601String(),
    "end_time": endTime?.toIso8601String(),
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "total_hours": totalHours,
    "salaryRate": salaryRate,
    "amount": amount,
    "busn_id": busnId,
  };
}
