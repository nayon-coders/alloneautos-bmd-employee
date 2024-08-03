import 'dart:convert';

import 'package:employee_management_system/app_config.dart';
import 'package:employee_management_system/controller/api_controller.dart';
import 'package:employee_management_system/model/working_hours.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/salary_model.dart';

class WorkingController{

  //clocking
  static Future<bool> clocking()async{
    SharedPreferences _pref = await SharedPreferences.getInstance(); 
    var id = _pref.getString("user_id");
    print("id --- ${id}");
    var res = await ApiService.postApi(url: AppConfig.CLOCKING,
        body: {
          "employeeID": id
        },
    );
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }


  static Future<bool> clockOut()async{

    SharedPreferences _pref = await SharedPreferences.getInstance();
    var id = _pref.getString("user_id");
    var res = await ApiService.putApi(url: AppConfig.CLOCKOUT,
        body:{
          "employeeID": id
        }
    );
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }


  //get total working list
  static Future<WorkingHoursModel>getTotalWorkings(month, year)async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var id = _pref.getString("user_id");
    var res = await ApiService.getApi(url: AppConfig.WORKING_HOURS+"$id?&month=$month&year=$year");
    return WorkingHoursModel.fromJson(jsonDecode(res.body)); 
  }


  //get today working list
  static Future<WorkingHoursModel>getTodayWorkings( date)async{
    print("date ---- ${date}");
    print("date ---- ${AppConfig.TODAY_WORKING+"?date=$date"}");
    var res = await ApiService.getApi(url: AppConfig.TODAY_WORKING+"?date=$date");

    print("jsonDecode(res.body) --- ${(res.body)}");
    print("jsonDecode(res.body) --- ${(res.statusCode)}");
    return WorkingHoursModel.fromJson(jsonDecode(res.body));
  }


  //check clock in or not
  Future checkClockInOrNot(today)async{

    var data = await getTodayWorkings(today);

    //check the start time or data is exist or not
    if(data.data!.isNotEmpty){
      for(var i in data.data!){
        isEndTimeNotNull(i.endTime);
      }

    }else{
      isEndTimeNotNull(null);
    }
  }

   bool isEndTimeNotNull(dynamic endTime) {
    return endTime != null;
  }


  //get my salary
  static Future<SaleryModel> getMySalary(month, year)async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var id = _pref.getString("user_id");
    print("adfdasfsd- ${AppConfig.MY_SALARY+"$id?month=$month&year=$year"}");
    var res = await ApiService.getApi(url: AppConfig.MY_SALARY+"$id?month=$month&year=$year");
    print("res -- ${res.statusCode}");
    return SaleryModel.fromJson(jsonDecode(res.body));
  }
  //get my salary
  static Future<SaleryModel> getTotalHours()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var id = _pref.getString("user_id");
    var res = await ApiService.getApi(url: AppConfig.MY_SALARY+"$id");
    return SaleryModel.fromJson(jsonDecode(res.body));
  }


}