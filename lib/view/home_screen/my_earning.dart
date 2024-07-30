import 'package:employee_management_system/utility/app_color.dart';
import 'package:flutter/material.dart';

class MyEarning extends StatefulWidget {
  const MyEarning({super.key});

  @override
  State<MyEarning> createState() => _MyEarningState();
}

class _MyEarningState extends State<MyEarning> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back,color: AppColors.mainColor,),
        ),
        title: Text("My Earnings ",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textBlack),
        ),


        backgroundColor: AppColors.bgWhite,
        surfaceTintColor: Colors.transparent,

      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$120",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 50,color: AppColors.textBlack),),
                  SizedBox(width: 6,),
                  Text("76 Hr",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: AppColors.textBlack),),

                ],
              ),
            )



          ],
        ),
      ),
    ));
  }
}
