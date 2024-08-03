import 'package:employee_management_system/utility/app_const.dart';
import 'package:flutter/material.dart';

import '../../../model/salary_model.dart';

class PaymentSheet extends StatefulWidget {
  final PaymentDetails paymentDetails;
  const PaymentSheet({super.key, required this.paymentDetails});

  @override
  State<PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         Text("${widget.paymentDetails!.date}",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
         ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pay: ",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
              ),
              Text('\$${widget!.paymentDetails!.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pay By: ",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
              ),
              Text('${widget!.paymentDetails!.payBy}',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pay: ",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
              ),
              Text('Paid',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
              )
            ],
          ),

          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
