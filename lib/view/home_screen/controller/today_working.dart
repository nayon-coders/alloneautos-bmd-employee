import 'package:employee_management_system/controller/working_controller.dart';
import 'package:flutter/material.dart';

getSelectedDateWorkingHours(List<String> date)async{

  var res = await WorkingController.getTodayWorkings(date);


}


String calculateTheTime(timeList){
  var totalMinutes = 0;
  for (String time in timeList) {
    List<String> parts = time.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    totalMinutes += hours * 60 + minutes;
  }

  int totalHours = totalMinutes ~/ 60;
  int remainingMinutes = totalMinutes % 60;

  String formattedTotalTime = '${totalHours.toString().padLeft(2, '0')}:${remainingMinutes.toString().padLeft(2, '0')}';

  print('Total time: $formattedTotalTime');
  return formattedTotalTime.toString();
}

