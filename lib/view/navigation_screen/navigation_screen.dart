import 'package:employee_management_system/view/home_screen/home_screen.dart';
import 'package:employee_management_system/view/payment_screen/payment_screen.dart';
import 'package:employee_management_system/view/track_time/track_time.dart';
import 'package:flutter/material.dart';

import '../../utility/app_color.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final List _pages = [
    HomeScreen(),
    PaymentScreen(),
    TrackTime(),
    TrackTime(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.mainColor,
        selectedItemColor: AppColors.textWhite,
        unselectedItemColor: AppColors.textWhite,
        currentIndex: _currentIndex,
          onTap: (index){
          setState(() {
            _currentIndex= index;
          });
          },
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: "HOME"),
            BottomNavigationBarItem(icon: Icon(Icons.payment,color: Colors.white,),label: "PAYMENT"),
            BottomNavigationBarItem(icon: Icon(Icons.timeline,color: Colors.white,),label: "TRACK TIME"),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,),label: "PROFILE"),

          ]
      ),
    );
  }
}
