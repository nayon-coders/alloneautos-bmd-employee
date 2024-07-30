import 'package:employee_management_system/controller/working_controller.dart';
import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/view/home_screen/clock_success.dart';
import 'package:employee_management_system/view/home_screen/my_earning.dart';
import 'package:employee_management_system/view/home_screen/track_work_time.dart';
import 'package:employee_management_system/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:holdable_button/holdable_button.dart';
import 'package:scale_button/scale_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _trackingList = ["Day One","Day Two","Day Three"];
  String? selected;


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
              color: Color(0xFFE0F2F1FF),
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
                  Center(child: Text("07:15",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: AppColors.textBlack),)),


                  //DropDown  View full day tracking
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: CustomDropDown(
                          items: _trackingList,
                          hint: "View full day tracking",
                          onChange: (V){
                            setState(() {
                              selected = V;
                            });

                          }),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30,),

            Center(
              child: HoldableButton(
                height: 110,
                width: 110,
                resetAfterFinish: true,
                buttonColor: AppColors.mainColor,
                loadingColor: AppColors.mainColor.withOpacity(0.5),
                radius: 100,
                duration: 2,
                startPoint: 0.25,
                onConfirm: () {
                  //clock in
                  clockIn();
                  // Callback when animation completes
                },
                strokeWidth: 30,
                child: _isLoading ? Center(child: CircularProgressIndicator.adaptive(),) : Text('Clocking',
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
    var res = await WorkingController.clocking();
    if(res){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ClockingSuccess()));
    }
    setState(()=>_isLoading = false );
  }
}
