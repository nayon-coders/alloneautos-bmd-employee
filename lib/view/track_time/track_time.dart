import 'package:employee_management_system/utility/app_color.dart';
import 'package:flutter/material.dart';

class TrackTime extends StatefulWidget {
  const TrackTime({super.key});

  @override
  State<TrackTime> createState() => _TrackTimeState();
}

class _TrackTimeState extends State<TrackTime> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgWhite,

      body: Center(
        child: Text("UpComing..",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.black),),
      ),
    ));
  }
}
