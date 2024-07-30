import 'package:employee_management_system/view/auth/success.dart';
import 'package:employee_management_system/widgets/app_button.dart';
import 'package:employee_management_system/widgets/app_input.dart';
import 'package:flutter/material.dart';

import '../../utility/app_color.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final _otpOne = TextEditingController();
  final _otpTwo = TextEditingController();
  final _otpThree = TextEditingController();
  final _otpFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor:AppColors.bgWhite,

      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),

            Text('OTP',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: AppColors.textBlack),),
            SizedBox(height: 6,),
            SizedBox(
                width:200,
                child: Text("Login by your phone number and OTP",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.textBlack),
                ),
            ),
            SizedBox(height: 60,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: AppInput(hint: "", controller: _otpOne,textType: TextInputType.number,),
                ),
                SizedBox(
                  width: 50,
                  child: AppInput(hint: "", controller: _otpOne,textType: TextInputType.number,),
                ),
                SizedBox(
                  width: 50,
                  child: AppInput(hint: "", controller: _otpOne,textType: TextInputType.number,),
                ),
                SizedBox(
                  width: 50,
                  child: AppInput(hint: "", controller: _otpOne,textType: TextInputType.number,),
                ),
              ],
            )

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AppButton(
          name: "Continue",
          onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Success()))
        ),
      ),
    ));
  }
}
