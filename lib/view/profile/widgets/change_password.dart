import 'dart:convert';

import 'package:employee_management_system/view/auth/pin_verifuy_popuo.dart';
import 'package:employee_management_system/view/navigation_screen/navigation_screen.dart';
import 'package:flutter/material.dart';

import '../../../controller/auth_controller.dart';
import '../../../utility/app_color.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_input.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final _newPassword = TextEditingController();
  final _oldPass = TextEditingController();
  final _retryPassword = TextEditingController();

  final _key = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,

      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: AppColors.textBlack,)
        ),
        backgroundColor: AppColors.bgWhite,
        title: Text("Change Password",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.textBlack),
        ),
        surfaceTintColor: Colors.transparent,
      ),


      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text("Old Password", style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack),),
            SizedBox(height: 10,),
            AppInput(hint: "Old Password", controller: _oldPass,),
            SizedBox(height: 20,),


            Text("New Password", style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack),),
            SizedBox(height: 10,),
            AppInput(hint: "New Password", controller: _newPassword,
              validator: (v) {
                if (v
                    .toString()
                    .length <= 6) {
                  return "Password must be 6 characters or more then 6 characters";
                }
                return null;
              },
            ),

            SizedBox(height: 20,),
            Text("Re-try Password", style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack),),
            SizedBox(height: 10,),
            AppInput(
              hint: "Re-try Password",
              controller: _retryPassword,
              validator: (v) {
                if (v.toString() != _newPassword.text) {
                  return "Password not match";
                }
                return null;
              },
            ),

            SizedBox(height: 30),
            AppButton(isLoading: _isLoading,
                name: "Change Password",
                onClick: () async {

                if (_key.currentState!.validate()) {
                  setState(() => _isLoading = true);

                  if (_newPassword.text.length <= 6) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Password must be 6 characters or more then 6 characters."),
                      duration: Duration(milliseconds: 1500),
                      backgroundColor: Colors.red,
                    ));
                    setState(() => _isLoading = false);
                    return;
                  }
                  if (_newPassword.text != _retryPassword.text) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Password dose not match."),
                      duration: Duration(milliseconds: 1500),
                      backgroundColor: Colors.red,
                    ));
                    setState(() => _isLoading = false);
                    return;
                  }
                }
                showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return PinVerifyPopUp(callBack: callBackPinVerification,);
                    },
                  );
                }
            ),
          ],
        ),
      ),
    );
  }

  void callBackPinVerification(bool response) async {
    if(response){
      var data = {
        "old_password": _oldPass.text,
        "new_password": _newPassword.text
      };

      var res = await AuthController.employeePassChange(data);
      if (res) {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NavigationScreen(index: 3,)));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password has been changed."),
          duration: Duration(milliseconds: 1500),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something went wrong."),
          duration: Duration(milliseconds: 1500),
          backgroundColor: Colors.red,
        ));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("PIN is not verified."),
        duration: Duration(milliseconds: 2000),
        backgroundColor: Colors.red,
      ));
    }


      setState(() => _isLoading = false);
    }
}