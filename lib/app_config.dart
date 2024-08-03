import 'package:flutter/material.dart';


class AppConfig{
  static const String DOMAIN = "https://employee-menagement-server.vercel.app";
  static const String API = "/api/v1";

  static const String BASE_URL = "$DOMAIN/api/v1";



  static const String LOGIN = "$BASE_URL/employee/login";
  static const String SINGLE_USER = "$BASE_URL/employee/me";
  static const String USER_URPDATE = "$BASE_URL/employee/update/";


  static const String WORKING_HOURS = "$BASE_URL/work-time/all?employeeID=";
  static const String TODAY_WORKING = "$BASE_URL/work-time/today";
  static const String CLOCKING = "$BASE_URL/work-time/start";
  static const String CLOCKOUT = "$BASE_URL/work-time/end";
  static const String CHECK_PIN = "$BASE_URL/employee/check";
  static const String MY_SALARY = "$BASE_URL/salary/all";
}