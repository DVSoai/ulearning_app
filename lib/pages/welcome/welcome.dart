
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_state.dart';


import 'bloc/welcome_event.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController  = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder:(context, state){
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                      children: [
                    _page(
                        1,
                        context,
                        "Next",
                        "First see Learning",
                        "Forget  about a for of paper  all knowledge in on learning",
                        "assets/images/reading.png"
                    ),
                    _page(
                        2,
                        context,
                        "Next",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor & friend. Let's get connected.",
                        "assets/images/boy.png"
                    ),
                    _page(
                        3,
                        context,
                        "Get Started",
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at our discretion so study whenever you want.",
                        "assets/images/man.png"),
                  ]),
                  Positioned(
                    bottom: 80.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(16.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),

                    ),
                  )
                ],
              ),
            );
          }
        )


      ),
    );

  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 430.h,
          child: Image.asset(imagePath,fit: BoxFit.cover,),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          title,
          style: TextStyle(
              color:AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: (){
            if(index <3){
              pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
            }else{
              Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context).pushNamedAndRemoveUntil('/signIn', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 60.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            )),
          ),
        )
      ],
    );
  }
}
