import 'package:employee_management_system/controller/auth_controller.dart';
import 'package:employee_management_system/controller/working_controller.dart';
import 'package:employee_management_system/view/profile/widgets/change_password.dart';
import 'package:employee_management_system/view/profile/widgets/change_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var totalHours, totalIncome, totalPaid, totalUpPaid;
  getTotal()async{
    var res = await WorkingController.getTotalHours();
    setState(() {
      totalHours = res.totalEarningsHours ?? "";
      totalIncome = res.totalAmount!.toStringAsFixed(2) ?? "";
      totalPaid = res.totalPayment!.toStringAsFixed(2) ?? "";
      totalUpPaid = double.parse("${totalIncome}") - double.parse(totalPaid);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Total Hours",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black
                        ),
                      ),
                      Text("${totalHours} h",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Total Income",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black
                        ),
                      ),
                      Text("\$${totalIncome}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Total Paid",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black
                        ),
                      ),
                      Text("\$${totalPaid}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Total Unpaid",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black
                        ),
                      ),
                      Text("\$${totalUpPaid}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),


            Text("Profile",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountsSettings())),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200
                ),
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Profile Setting"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword())),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200
                ),
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Change Password"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Text("Legal",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200
              ),
              child: ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy Policy"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200
              ),
              child: ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text("Terms & Conditions"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            InkWell(
              onTap: ()=> AuthController.logout(context),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200
                ),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            )


          ],
        ),
      )
    );
  }
}
