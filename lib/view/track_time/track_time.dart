import 'package:employee_management_system/controller/working_controller.dart';
import 'package:employee_management_system/model/working_hours.dart';
import 'package:employee_management_system/utility/app_color.dart';
import 'package:employee_management_system/utility/app_const.dart';
import 'package:employee_management_system/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrackTime extends StatefulWidget {
  const TrackTime({super.key});

  @override
  State<TrackTime> createState() => _TrackTimeState();
}

class _TrackTimeState extends State<TrackTime> {

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
    _getAllWorkingHours = WorkingController.getTotalWorkings(month, year);

  }


  Future<WorkingHoursModel>? _getAllWorkingHours;
  Future<WorkingHoursModel>? getTotalWork()async{
    return await WorkingController.getTotalWorkings(month, year);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllWorkingHours = getTotalWork();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        title: Text("My Working Hours"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child:    InkWell(
            onTap: ()=>_showDate(),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 60,
              width: double.infinity,
              color: AppColors.mainColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${DateFormat("MMM, yyyy").format(selectedDate)}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textWhite),),
                  IconButton(onPressed: ()=>_showDate(), icon: Icon(Icons.date_range,color: Colors.white,)),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: FutureBuilder<WorkingHoursModel>(
          future: _getAllWorkingHours,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator.adaptive(),);
            }

            return  snapshot.data!.data!.isNotEmpty ? ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (_, index){
                var data = snapshot.data!.data![index];
                print("data.date ---${data.date}");
                 return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TrackTimeItems(
                          title: "Date",
                          data: convertUSADate(DateTime.parse("${data.date}")),
                        ),
                        TrackTimeItems(
                          title: "Clock In",
                          data: "${convertTimeToHours(DateTime.parse("${data.startTime}"))}",
                        ),
                        TrackTimeItems(
                          title: "Clock out",
                          data: "${data.endTime != null ? convertTimeToHours(DateTime.parse("${data.endTime}")) : "Clock Out"}",
                        ),
                        TrackTimeItems(
                          title: "T:H",
                          data: "${data.totalHours}",
                        )
                      ],
                    ),
                  );
            
              },
            ) : EmptyScreen();
          }
        ),
      )
    ));
  }
}

class TrackTimeItems extends StatelessWidget {
  const TrackTimeItems({
    super.key, required this.title, required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$title"),
        Text("$data",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }
}
