import 'dart:convert';

import 'package:employee_management_system/app_config.dart';
import 'package:employee_management_system/controller/api_controller.dart';
import 'package:employee_management_system/view/auth/pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../view/navigation_screen/navigation_screen.dart';


class AuthController{
  
  //login controller
 static Future login({required BuildContext context, required String email, required String pass})async{

   //Shared Preferences instance
   SharedPreferences _pref = await SharedPreferences.getInstance();

   var response = await http.post(
      Uri.parse("${AppConfig.LOGIN}"),
      body: jsonEncode({
          "email": email,
          "password": pass
        }),

     headers: {
        "Content-Type" : "application/json"
     }
    );

    var body = jsonDecode(response.body);


    if(response.statusCode == 200){
      //login success

      _pref.setString("token", "${body["data"]["token"]}");
      _pref.setString("user_id", "${body["data"]["user"]["id"]}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login success..."),
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 3000),
      ));
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PINScreen()), (route) => false);
    }else{
      //login failed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${body["error"]}"),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 3000),
      ));
    }
  }


  //logout
  static Future logout(context)async{
   SharedPreferences _pref = await SharedPreferences.getInstance();
   _pref.remove("token");
   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)), (route) => false);
  }



 //PIN VERIFICATION
 static Future<bool> pinVerification(pin)async{
   print("pin --- ${pin}");
   var res = await ApiService.postApi(
       url: AppConfig.CHECK_PIN,
       body: {
         "reqEmailPin": pin
       }
   );
   if(res.statusCode == 200){
     return true;
   }else{
     return false;
   }
 }




}