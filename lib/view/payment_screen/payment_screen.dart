import 'package:employee_management_system/utility/app_color.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Future _showDate()async{
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: ()=>Navigator.pop(context),
        //   icon: Icon(Icons.arrow_back,color: AppColors.mainColor,),
        // ),



        title: Text("Payment  History",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.textBlack),
        ),

        actions: [
          IconButton(onPressed: ()=>_showDate(), icon: Icon(Icons.date_range,color: AppColors.mainColor,)),
        ],

        backgroundColor: AppColors.bgWhite,
        surfaceTintColor: Colors.transparent,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            height: 70,
            width: double.infinity,
            color: AppColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //Date
                SizedBox(
                    width:40,
                    child: Text("Date",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textWhite),
                    )
                ),

                //Pay
                SizedBox(
                    width: 80,
                    child: Text("Pay",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textWhite),
                    )
                ),

                //Status
                SizedBox(
                    width:80,
                    child: Text("Status",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textWhite),
                    )
                ),

                //Info
                SizedBox(
                    width: 80,
                    child: Text("Info",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textWhite),)),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_,index){
                  return Container(
                    padding: EdgeInsets.only(left: 10,right: 10),

                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.textWhite,
                        border: Border.symmetric(
                          vertical: BorderSide.none,
                          horizontal: BorderSide(color: Colors.grey.shade200),
                        )

                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


                        //Date
                        Container(
                          padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.teal.shade100,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("12",style: TextStyle(fontWeight: FontWeight.w500,fontSize:14,color: AppColors.mainColor ),),
                              Text("Jun",style: TextStyle(fontWeight: FontWeight.w600,fontSize:14,color: AppColors.textBlack ),),
                            ],
                          ),
                        ),

                        //Pay
                        SizedBox(
                            width: 80,
                            child: Text("\$75",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack),
                            )
                        ),


                        //Status
                        SizedBox(
                            width:80,
                            child: Text("Finish",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainColor),
                            )
                        ),

                        //Info
                        SizedBox(
                            width: 80,
                            child:IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.visibility_outlined,color: AppColors.textBlack,),
                            ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
