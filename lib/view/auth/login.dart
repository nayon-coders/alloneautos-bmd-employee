import 'package:employee_management_system/controller/auth_controller.dart';
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
  final _email = TextEditingController();
  final _password = TextEditingController();


  final _key = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
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
              Text("Email Number",
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack),
              ),
              SizedBox(height: 10,),
              AppInput(
                prefixIcon: Icon(Icons.email,color: Colors.grey,),
                hint: "Email", controller: _email,textType: TextInputType.text,),

              SizedBox(height: 20,),
              Text("Password",
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack),
              ),
              SizedBox(height: 10,),
              AppInput(
                obscureText: true,
                prefixIcon: Icon(Icons.key,color: Colors.grey,),
                hint: "password", controller: _password,textType: TextInputType.text, ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15.0),
        margin: EdgeInsets.all(20),
        child: AppButton(
            isLoading: _isLoading,
            name: "Continue",
            onClick: ()async{
              if(_key.currentState!.validate()){
                setState(() => _isLoading = true);

                await AuthController.login(context: context, email: _email.text, pass: _password.text);

                setState(() => _isLoading = false);
              }

            }
        ),
      ),
    );
  }
}
