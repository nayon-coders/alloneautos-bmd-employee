import 'package:employee_management_system/utility/app_assets.dart';
import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/view/navigation_screen/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/login.dart';
import '../auth/pin_screen.dart';

class Flash extends StatefulWidget {
  const Flash({super.key});

  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  // token variable
  var token; //store the user token


  //get token method
  getToken()async{
    //Shared Preference instance
    SharedPreferences _pref = await SharedPreferences.getInstance();

    //store user token to "token" variable
    setState(() {
      token = _pref.getString("token");
    });

    //check token is null or not
    if(token == null){
      //is not null, then redirect to the Navigation screen
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PINScreen()), (route) => false);
    }else{
      //is null, then delayed 2 sec and redirect to the login page.
      Future.delayed(Duration(seconds: 2),()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>LogIn())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.logo,),
         

        ],
      ),
      ),
    );
  }
}
