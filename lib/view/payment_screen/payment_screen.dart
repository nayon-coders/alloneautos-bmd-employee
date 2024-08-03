import 'package:employee_management_system/controller/working_controller.dart';
import 'package:employee_management_system/model/salary_model.dart';
import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/utility/app_const.dart';
import 'package:employee_management_system/widgets/empty_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {


  Future<SaleryModel> ? _getAllSalery;

  var month = DateFormat("MM").format(DateTime.now());
  var year = DateFormat("yyyy").format(DateTime.now());
  var selectedDate = DateTime.now();


  Future _showDate()async{
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
    _getAllSalery = WorkingController.getMySalary(month, year);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllSalery = WorkingController.getMySalary(month, year);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    width:100,
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
          FutureBuilder(
            future: _getAllSalery,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator.adaptive(),);
              }

              return snapshot.data!.amountData!.isNotEmpty ? Expanded(
                flex: snapshot.data!.amountData!.length,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_,index){
                      var data = snapshot.data!.amountData![index];

                      
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
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${convertUSADate(data.date)}",style: TextStyle(fontWeight: FontWeight.w500,fontSize:14,color: AppColors.mainColor ),),
                                ],
                              ),
                            ),

                            //Pay
                            Container(
                              width: 100,
                                padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal.shade100,
                                ),
                                child: Text("\$${data.amount}",
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
              ) : EmptyScreen();
            }
          )
        ],
      ),
    ));
  }
}
