import 'package:employee_management_system/utility/app_assets.dart';
import 'package:employee_management_system/view/auth/pin_screen.dart';
import 'package:employee_management_system/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utility/app_color.dart';

class ClockingSuccess extends StatefulWidget {
  const ClockingSuccess({super.key});

  @override
  State<ClockingSuccess> createState() => _ClockingSuccessState();
}

class _ClockingSuccessState extends State<ClockingSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Lottie.asset("assets/animation/successful.json"),),

          //Center(child: Image.asset(Assets.success,height: 200,)),
          SizedBox(height: 15,),
          Text("You are Clock In",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AppButton(name: "Go Back", onClick: ()=>Navigator.pop(context)),
      ),
    );
  }
}
