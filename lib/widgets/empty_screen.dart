
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({super.key});

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/img.png",height: 200,width: 200,),),
          Text("Data Not Found !",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.textBlack),),

        ],
      ),
    );
  }
}
