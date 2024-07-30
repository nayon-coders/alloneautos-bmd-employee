import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ApiService{

  //post api
  static Future<http.Response> postApi({required String url, required dynamic body})async{
   SharedPreferences _pref = await SharedPreferences.getInstance();
   var token = _pref.getString("token");

    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Authorization" : "Bearer $token",
        "Content-Type" : "application/json"
      }
    );
    debugPrint("Url -------- ${url}");
    debugPrint("Status Code -------- ${response.statusCode}");
    debugPrint("Status Body -------- ${response.body}");
    return response;
  }


  //put api
  static Future<http.Response> putApi({required String url, required Map<String, dynamic> body})async{
    var response = await http.put(
      Uri.parse(url),
      body: body,
    );
    return response;
  }


  //post api
  static Future<http.Response> deleteApi({required String url})async{
    var response = await http.delete(
      Uri.parse(url),
    );
    return response;
  }


  //get api
  static Future<http.Response> getApi({required String url})async{
    var response = await http.get(
      Uri.parse(url),
    );
    return response;
  }

}