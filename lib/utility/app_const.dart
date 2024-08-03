

import 'package:intl/intl.dart';

String convertUSADate(picked)=>DateFormat("MM-dd-yyyy").format(picked);

String convertTimeToHours(time) => DateFormat("HH:mm a").format(time);

String convertDatabaseDate(picked){
  DateTime parsedDate = DateFormat("MM-dd-yyyy").parse(picked);

  // Format the date to "yyyy-MM-dd"
  String formattedDate = DateFormat("yyyy-MM-dd").format(parsedDate);
  return formattedDate;
}
