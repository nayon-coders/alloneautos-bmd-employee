import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/view/home_screen/my_earning.dart';
import 'package:employee_management_system/view/home_screen/track_work_time.dart';
import 'package:employee_management_system/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(child: Scaffold(
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
              padding: EdgeInsets.all(10),
              width:double.infinity ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.shade100),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  //Today:05:03 AM date time
                  Text("Today",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: AppColors.textBlack),),
                  Text("05:03 AM",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
                   SizedBox(height: 30,),

                  //Today Total work
                  Center(child: Text("Today Total work",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),)),
                  Center(child: Text("07:15",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: AppColors.textBlack),)),
                  SizedBox(height: 30,),


                  //DropDown  View full day tracking
                  Center(
                    child: SizedBox(
                      width: 210,
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
                  SizedBox(height: 20,),

                ],
              ),
            ),
            SizedBox(height: 50,),



            //Clocking Button
            Center(
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal.shade100,
                  ),
                  child: Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainColor,
                      ),
                      child: Center(child: Text("Clock In",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textWhite),),),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    ));
  }
}
