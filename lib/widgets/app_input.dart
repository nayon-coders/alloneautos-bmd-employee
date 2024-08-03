
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class AppInput extends StatelessWidget {
  AppInput({super.key,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.textType,
    this.onClick,
    this.maxLine = 1

  });
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final TextInputType?textType;
  final VoidCallback? onClick;
  final int maxLine;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onClick,
      maxLines: maxLine,
      keyboardType:textType,
      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color:Colors.black),
      readOnly:readOnly ,
      obscureText:obscureText ,
      controller:controller ,
      validator: (v){
        if(v!.isEmpty){
          return "Filed must not be empty";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15,),
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: AppColors.textBlack),

        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
