import 'package:employee_management_system/utility/app_assets.dart';
import 'package:employee_management_system/view/auth/pin_screen.dart';
import 'package:employee_management_system/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utility/app_color.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgWhite,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Lottie.asset("assets/animation/successful.json"),),
          
          //Center(child: Image.asset(Assets.success,height: 200,)),
          SizedBox(height: 15,),
          Text("You are all set",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack),
          ),
          SizedBox(height: 8,),
          Center(
            child: SizedBox(
              width: 165,
                child: Text("You have 4 digit pin.\nDon’t forget it.\nUse it  when Clocking.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlack),
                )),
          )
          
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AppButton(name: "Continue", onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>PINScreen()))),
      ),
    ));
  }
}
