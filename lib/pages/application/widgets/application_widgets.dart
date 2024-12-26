
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/profile/profile_page.dart';

import '../../../common/values/colors.dart';
import '../../home/home.dart';

Widget buildPage(int index){
  List<Widget> widgets = [
    const HomePage(),
    const Center(
      child: Text("Search Page"),
    ),
    const Center(
      child: Text("s Page"),
    ),
    const Center(
      child: Text("Chat Page"),
    ),
    const ProfilePage()
  ];
  return widgets[index];
}
 var bottomTabs = [
   BottomNavigationBarItem(
     label: "Home",
     icon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/home.png"),
     ),
     activeIcon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/home.png", color: AppColors.primaryElement),
     ),
   ),
   BottomNavigationBarItem(
     label: "Search",
     icon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/search2.png"),
     ),
     activeIcon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/search2.png", color: AppColors.primaryElement),
     ),
   ),
   BottomNavigationBarItem(
     label: "Course",
     icon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/play-circle1.png"),
     ),
     activeIcon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/play-circle1.png", color: AppColors.primaryElement),
     ),
   ),
   BottomNavigationBarItem(
     label: "Chat",
     icon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/message-circle.png"),
     ),
     activeIcon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/message-circle.png", color: AppColors.primaryElement),
     ),
   ),
   BottomNavigationBarItem(
     label: "Profile",
     icon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/person2.png"),
     ),
     activeIcon: SizedBox(
       width: 15.w,
       height: 15.h,
       child: Image.asset("assets/icons/person2.png", color: AppColors.primaryElement),
     ),
   )
 ];