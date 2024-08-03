import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../controller/auth_controller.dart';


class PinVerifyPopUp extends StatefulWidget {
  final Function(bool data)? callBack;
  const PinVerifyPopUp({super.key,  this.callBack});

  @override
  State<PinVerifyPopUp> createState() => _PinVerifyPopUpState();
}

class _PinVerifyPopUpState extends State<PinVerifyPopUp> {
  var vefiryCode;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Verify you PIN'),
      content:  SingleChildScrollView(
        child: _isLoading ? Center(child: CircularProgressIndicator.adaptive(),) : ListBody(
          children: <Widget>[
            Text('Type you r4 Digit PINK'),
            SizedBox(height: 15,),
            Container(
              // margin: EdgeInsets.all(30),
              child:  OtpTextField(
                contentPadding: EdgeInsets.zero,
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
                numberOfFields: 4,
                fieldWidth: 40,
                fieldHeight: 40,

                borderColor: Color(0xFF512DA8),
                enabledBorderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,

                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode)async{

                  setState(() {
                    vefiryCode = verificationCode;
                  });
                  onSubmit();
                }, // end onSubmit
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  bool _isLoading = false;
  onSubmit()async{
    if(vefiryCode != null){
      setState(() => _isLoading = true);
      var res = await AuthController.pinVerification(vefiryCode);
      if(res){
        widget.callBack!(true);
        Navigator.pop(context);
      } else{
        widget.callBack!(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Your pin is not correct"),
          duration: Duration(milliseconds: 1500),
          backgroundColor: Colors.red,
        ));
        Navigator.pop(context);
      }
      setState(() => _isLoading = false);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("PIN must not be empty."),
        duration: Duration(milliseconds: 1500),
        backgroundColor: Colors.red,
      ));
    }
  }

}
