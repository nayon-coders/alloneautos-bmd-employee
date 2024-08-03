import 'package:employee_management_system/controller/auth_controller.dart';
import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/view/navigation_screen/navigation_screen.dart';
import 'package:employee_management_system/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../widgets/app_input.dart';

class PINScreen extends StatefulWidget {
  const PINScreen({super.key});

  @override
  State<PINScreen> createState() => _PINScreenState();
}

class _PINScreenState extends State<PINScreen> {

  var vefiryCode;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColors.bgWhite,

          body: SingleChildScrollView(
    padding: EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
        ),
        Text(
          "PIN",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: AppColors.textBlack),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          child: Text(
            "You have 4 digit pin. Check your email and Use it.",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.textBlack),
          ),
        ),

        SizedBox(
          height: 60,
        ),
        Container(
         // margin: EdgeInsets.all(30),
          child:  OtpTextField(
            numberOfFields: 4,
            fieldWidth: 60,
            fieldHeight: 60,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,

            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
                setState(() {
                  vefiryCode = verificationCode;
                });
               // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationScreen()), (route) => false);
              // showDialog(
              //     context: context,
              //     builder: (context){
              //       return AlertDialog(
              //         title: Text("Verification Code"),
              //         content: Text('Code entered is $verificationCode'),
              //       );
              //     }
              // );
            }, // end onSubmit
          ),
        )
      ],
    ),
          ),

          //Button
          bottomNavigationBar: Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          child: AppButton(
            isLoading: _isLoading,
              name: "Continue",
              onClick: ()async{

              if(vefiryCode != null){
                setState(() => _isLoading = true);
                var res = await AuthController.pinVerification(vefiryCode);
                if(res){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationScreen()), (route) => false);
                } else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Your pin is not correct"),
                    duration: Duration(milliseconds: 1500),
                    backgroundColor: Colors.red,
                  ));
                }
                setState(() => _isLoading = false);
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("PIN must not be empty."),
                  duration: Duration(milliseconds: 1500),
                  backgroundColor: Colors.red,
                ));
              }



                  // if(vefiryCode == "1234"){
                  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationScreen()), (route) => false);
                  // }
          }
              )));
  }
}
