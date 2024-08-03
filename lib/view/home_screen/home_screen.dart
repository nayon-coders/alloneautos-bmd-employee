import 'package:employee_management_system/controller/working_controller.dart';
import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/utility/app_const.dart';
import 'package:employee_management_system/view/home_screen/clock_success.dart';
import 'package:employee_management_system/view/home_screen/controller/today_working.dart';
import 'package:employee_management_system/view/home_screen/my_earning.dart';
import 'package:employee_management_system/view/home_screen/track_work_time.dart';
import 'package:employee_management_system/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:holdable_button/holdable_button.dart';
import 'package:intl/intl.dart';
import 'package:scale_button/scale_button.dart';

import '../../model/working_hours.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _trackingList = ["Day One","Day Two","Day Three"];
  String? selected;
  var todayTotalHours = "0.00";

  var todayDate;

  Future<WorkingHoursModel>? _getTotayWorkingHours;
  Future<WorkingHoursModel>? _getAllWorkingHours;

  bool _isClokIn = true;
  bool _isClockInButtonDisable = false;
  bool _isTodayWorkLoading = false;
  List _times = [];
  Future<WorkingHoursModel>? getTodayWork(date)async{
    print("init date --- ${date}");
    _times.clear();
    todayTotalHours = "0.00";
    setState(() => _isTodayWorkLoading = true);

    var data = await WorkingController.getTodayWorkings(date);

    print("data.data! --- ${data.data!}");
    //check total hours

    if(date.toString() == todayDate.toString()){
      setState(() {
        _isClockInButtonDisable =  false;
      });

      if(data.data!.isNotEmpty){
        for(var i in data.data!){

          print("i.totalHours --- ${i.totalHours}");
          print("i.totalHours --- ${i.endTime}");

          if(i.totalHours != null && i.totalHours != "0:00"){
            _times.add(i.totalHours);
          }

          //check clock in or our
          if(i.endTime == null){
            setState(() {
              _isClokIn = WorkingController().isEndTimeNotNull(i.endTime);
            });
          }

        }
      }else{
        print("empty");
      }



    }else{
      setState(() {
        _isClockInButtonDisable =  true;
      });
    }

    //calculate the working time
    print("_times --- ${_times}");
    todayTotalHours = calculateTheTime(_times);

    setState(() => _isTodayWorkLoading = false);


    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      // Do something
      todayDate = convertDatabaseDate(DateFormat("MM-dd-yyyy").format(DateTime.now()));
      _getTotayWorkingHours = getTodayWork(todayDate);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>MyEarning())),
          child: Container(
            margin: EdgeInsets.all(10),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffe0f2f1ff),
            ),
            child: Center(child: Icon(Icons.person,color: AppColors.mainColor,),),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome, ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.mainColor),),
            Text("Nayon T",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>TrackWorkTime())),
              icon: Icon(Icons.notifications_active,color: AppColors.mainColor,size: 30,),)
        ],
        backgroundColor: AppColors.bgWhite,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Container(
              padding: EdgeInsets.all(20),
              width:double.infinity ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.shade100),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: AnalogClock(
                        dateTime: DateTime.now(),
                        isKeepTime: true,
                        dialColor: Colors.white,
                        dialBorderColor: Colors.black,
                        dialBorderWidthFactor: 0.02,
                        markingColor: Colors.black,
                        markingRadiusFactor: 1.0,
                        markingWidthFactor: 1.0,
                        hourNumberColor: Colors.black,
                        hourNumbers: const ['', '', '3', '', '', '6', '', '', '9', '', '', '12'],
                        hourNumberSizeFactor: 1.0,
                        hourNumberRadiusFactor: 1.0,
                        hourHandColor: Colors.black,
                        hourHandWidthFactor: 1.0,
                        hourHandLengthFactor: 1.0,
                        minuteHandColor: Colors.black,
                        minuteHandWidthFactor: 1.0,
                        minuteHandLengthFactor: 1.0,
                        secondHandColor: Colors.black,
                        secondHandWidthFactor: 1.0,
                        secondHandLengthFactor: 1.0,
                        centerPointColor: Colors.black,
                        centerPointWidthFactor: 1.0,
                      ),
                    ),
                  ),


                  //Today:05:03 AM date time
                   SizedBox(height: 30,),

                  //Today Total work
                  Center(child: Text("Today Total work",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),)),
                  Center(child: Text("${todayTotalHours}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: AppColors.textBlack),)),


                  //DropDown  View full day tracking
                  Center(
                    child: InkWell(
                      onTap: (){
                        _showDate();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor.withOpacity(0.3),

                        ),
                        margin: EdgeInsets.all(30),
                        child: Center(child: Text("Today Working Hours"),)
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30,),

            Center(
              child: _isTodayWorkLoading ? CircularProgressIndicator.adaptive()
                  : HoldableButton(
                      height: 110,
                      width: 110,
                      resetAfterFinish: true,
                      buttonColor: _isClokIn ? AppColors.mainColor : Colors.amber ,
                      loadingColor: AppColors.mainColor.withOpacity(0.5),
                      radius: 100,
                      duration: 2,
                      startPoint: 0.25,
                      onConfirm: () {
                        //clock in
                        if(_isClockInButtonDisable){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("This date is not correct"),
                            backgroundColor: Colors.red,
                            duration: Duration(milliseconds: 2000),
                          ));
                        }else{
                          clockIn();
                        }
                        //clockIn();
                        // Callback when animation completes
                      },
                      strokeWidth: 30,
                      child: _isLoading ? Center(child: CircularProgressIndicator.adaptive(),)
                    : Text('${_isClokIn ? "Clock In" : "Clock Out"}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Center(child: Text("Press & hold to Clocking"),)

          ],
        ),
      ),
    );
  }

  bool _isLoading = false;
  clockIn() async{
    setState(()=>_isLoading = true );
    if(_isClokIn){
      var res = await WorkingController.clocking();
      if(res){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ClockingSuccess(text: "You are Clock In",)));
      }
    }else{
      var res = await WorkingController.clockOut();
      if(res){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ClockingSuccess(text: "You are Clock Out",)));
      }
    }

    setState(()=>_isLoading = false );
  }





  //select date
  var month = DateFormat("MM").format(DateTime.now());
  var year = DateFormat("yyyy").format(DateTime.now());
  var selectedDate = DateTime.now();
  Future _showDate() async {

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        month = picked.month.toString();
        print(".... month --- ${month}");

        year = picked.year.toString();
        print(".... year --- ${year}");
      });
    _getAllWorkingHours = getTodayWork(convertDatabaseDate(DateFormat("MM-dd-yyyy").format(selectedDate)));
  }

}
