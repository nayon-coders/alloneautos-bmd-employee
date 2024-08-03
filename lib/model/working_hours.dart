// To parse this JSON data, do
//
//     final workingHoursModel = workingHoursModelFromJson(jsonString);

import 'dart:convert';

WorkingHoursModel workingHoursModelFromJson(String str) => WorkingHoursModel.fromJson(json.decode(str));

String workingHoursModelToJson(WorkingHoursModel data) => json.encode(data.toJson());

class WorkingHoursModel {
  final bool? success;
  final String? message;
  final int? totalWorkTime;
  final List<Datum>? data;

  WorkingHoursModel({
    this.success,
    this.message,
    this.totalWorkTime,
    this.data,
  });

  factory WorkingHoursModel.fromJson(Map<String, dynamic> json) => WorkingHoursModel(
    success: json["success"],
    message: json["message"],
    totalWorkTime: json["totalWorkTime"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalWorkTime": totalWorkTime,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final int? employeeId;
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? date;
  final String? totalHours;
  final String? salaryRate;
  final String? amount;
  final int? busnId;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
