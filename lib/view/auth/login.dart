import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/view/auth/otp.dart';
import 'package:employee_management_system/widgets/app_button.dart';
import 'package:employee_management_system/widgets/app_input.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Text("Login ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: AppColors.textBlack),),
            SizedBox(height: 6,),
            SizedBox(
              width: 200,
                child: Text("Login by your phone number and OTP",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.textBlack),
                ),
            ),
            SizedBox(height: 60,),
            Text("Phone Number",
              style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack),
            ),
            SizedBox(height: 10,),
            AppInput(
              prefixIcon: Icon(Icons.phone_iphone_sharp,color: Colors.grey,),
              hint: "Phone Number", controller: _number,textType: TextInputType.phone,),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AppButton(name: "Continue",
            onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>OTP()))),
      ),
    ));
  }
}
