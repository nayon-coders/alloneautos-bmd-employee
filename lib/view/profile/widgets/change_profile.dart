
import 'package:employee_management_system/view/navigation_screen/navigation_screen.dart';
import 'package:flutter/material.dart';

import '../../../controller/auth_controller.dart';
import '../../../utility/app_color.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_input.dart';


class AccountsSettings extends StatefulWidget {
  const AccountsSettings({super.key});

  @override
  State<AccountsSettings> createState() => _AccountsSettingsState();
}

class _AccountsSettingsState extends State<AccountsSettings> {
  final _userId = TextEditingController();
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _businessName = TextEditingController();
  final _businessAddress = TextEditingController();
  final _newPass = TextEditingController();

  final _key = GlobalKey<FormState>();


  bool _isLoading = false;
  bool _isDataLoading = false;
  getSingleUserInfo()async{
    setState(() => _isDataLoading = true);
    var user = await AuthController.getMyInfo();
    setState(() {
      _userId.text = user.id.toString();
      _email.text = user.email ?? "";
      _phone.text = user.phone ?? "";
      _businessName.text = user.businessName ?? "";
      _businessAddress.text = user.businessAddress ?? "";
      _name.text = user.name ?? "";
    });
    setState(() => _isDataLoading = false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSingleUserInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        title: Text("Account Settings"),
      ),

      body: _isDataLoading ? Center(child: CircularProgressIndicator.adaptive()) : SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("General Info",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20,),
              Text("Name",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              AppInput(hint: "Name", controller: _name),


              SizedBox(height: 20,),
              Text("Email",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              AppInput(hint: "Email", controller: _email, readOnly: true,),
              SizedBox(height: 20,),
              Text("Phone",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              AppInput(hint: "Phone", controller: _phone),

              SizedBox(height: 30,),
              AppButton(isLoading: _isLoading, name: "Change Information", onClick: ()async{
                if(_key.currentState!.validate()){

                  setState(() => _isLoading = true);

                  var data = {
                    "name": _name.text,
                    "phone": _phone.text,
                    "type": "employee",
                  };

                  await AuthController.updateSingleUser(data, _userId.text).then((value){
                    if(value){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationScreen(index: 3,)));

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Profile information has been changes"),
                        duration: Duration(milliseconds: 3000),
                        backgroundColor: Colors.green,
                      ));
                    }
                  });

                  setState(() => _isLoading = false);

                }

              })
            ],
          ),
        ),
      ),
    );
  }
}
