import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/view/navigation_screen/navigation_screen.dart';
import 'package:employee_management_system/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_input.dart';

class PINScreen extends StatefulWidget {
  const PINScreen({super.key});

  @override
  State<PINScreen> createState() => _PINScreenState();
}

class _PINScreenState extends State<PINScreen> {
  final _pinOne = TextEditingController();
  final _pinTwo = TextEditingController();
  final _pinThree = TextEditingController();
  final _pinFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.bgWhite,

      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: AppInput(
                    hint: "",
                    controller: _pinOne,
                    textType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: AppInput(
                    hint: "",
                    controller: _pinTwo,
                    textType: TextInputType.number,
                  ),
                ),

                SizedBox(
                  width: 50,
                  child: AppInput(
                    hint: "",
                    controller: _pinThree,
                    textType: TextInputType.number,
                  ),
                ),


                SizedBox(
                  width: 50,
                  child: AppInput(
                    hint: "",
                    controller: _pinFour,
                    textType: TextInputType.number,
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      //Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AppButton(
            name: "Continue",
            onClick: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => NavigationScreen()))),
      ),
    ));
  }
}
