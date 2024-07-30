import 'package:employee_management_system/utility/app_color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
   AppButton({super.key,
    required this.name,
    required this.onClick,
  });
  final String name;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(name,style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20,color: AppColors.textWhite),),
            SizedBox(width: 20,),
            Icon(Icons.arrow_forward,color: AppColors.textWhite,size: 25,),
          ],
        ),
      ),
    );
  }
}
