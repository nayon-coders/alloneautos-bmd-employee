import 'package:employee_management_system/utility/app_assets.dart';
import 'package:employee_management_system/utility/app_color.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';

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
    Future.delayed(Duration(seconds: 4),()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>LogIn())));
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
