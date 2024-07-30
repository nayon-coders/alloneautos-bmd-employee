import 'dart:convert';

import 'package:employee_management_system/app_config.dart';
import 'package:employee_management_system/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkingController{

  //clocking
  static Future<bool> clocking()async{
    SharedPreferences _pref = await SharedPreferences.getInstance(); 
    var id = _pref.getString("user_id");
    print("id --- ${id}");
    var res = await ApiService.postApi(url: AppConfig.CLOCKING,
        body: jsonEncode( {
          "employeeID": id
        }),
    );
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }


  static Future<bool> clockOut()async{
    var id;
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


}