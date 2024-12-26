
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/home/bloc/home_events.dart';
import 'package:ulearning_app/pages/home/bloc/home_states.dart';

import '../bloc/home_blocs.dart';

AppBar buildAppBarHome() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 16.w,
          height: 20.h,
          child: Image.asset("assets/icons/menu.png"),
        ),
        GestureDetector(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/person.png"),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 15}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(top: 15.h, right: 5.w),
        width: 280.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourElementText,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 20.w,
              height: 20.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/search.png"),
                ),
              ),
            ),
            SizedBox(
              width: 240.w,
              height: 45.w,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Search your course',
                    contentPadding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    )),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                autocorrect: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          margin: EdgeInsets.only(top: 15.h),
          width: 45.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget sliderView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 25.h),
        width: 335.w,
        height: 200.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(),
            _sliderContainer(image: "assets/icons/image_1.png"),
            _sliderContainer(image: "assets/icons/image_2.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(6.0),
            activeSize: const Size(17.0, 6.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      )
    ],
  );
}

Widget _sliderContainer({String image = "assets/icons/art.png"}) {
  return Container(
    width: 335.w,
    height: 200.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget menuView(BuildContext context, HomePageStates state) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _reusableSubTitleText("Choose your courses"),
              GestureDetector(
                  child: _reusableSubTitleText("See All",
                      color: AppColors.primaryThreeElementText, size: 10)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    context.read<HomePageBlocs>().add(SelectCourseType("All"));
                  },
                  child: _reusableMenuText("All",
                      textColor: state.selectedCourseType == "All"
                          ? AppColors.primaryElementText
                          : AppColors.primaryThreeElementText,
                    backgroundColor: state.selectedCourseType == "All"
                        ? AppColors.primaryElement
                        : Colors.white
                  )),
              GestureDetector(
                  onTap: () {
                    context
                        .read<HomePageBlocs>()
                        .add(SelectCourseType("Popular"));
                  },
                  child: _reusableMenuText("Popular",
                      textColor: state.selectedCourseType == "Popular"
                          ? AppColors.primaryElementText
                          : AppColors.primaryThreeElementText,
                      backgroundColor: state.selectedCourseType == "Popular"
                          ? AppColors.primaryElement
                          : Colors.white)),
              GestureDetector(
                  onTap: () {
                    context
                        .read<HomePageBlocs>()
                        .add(SelectCourseType("Newest"));
                  },
                  child: _reusableMenuText("Newest",
                      textColor: state.selectedCourseType == "Newest"
                          ? AppColors.primaryElementText
                          : AppColors.primaryThreeElementText,
                      backgroundColor: state.selectedCourseType == "Newest"
                          ? AppColors.primaryElement
                          : Colors.white)),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _reusableSubTitleText(String text,
    {Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold,
    double size = 16}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}

Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backgroundColor = AppColors.primaryElement}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backgroundColor)),
    child: _reusableSubTitleText(menuText,
        fontWeight: FontWeight.normal, color: textColor, size: 12),
  );
}

Widget courseGrid(HomePageStates state) {
  final  image = state.selectedCourseType == "All"
  ? "image_1.png"
      : state.selectedCourseType == "Popular"
  ? "image_2.png"
      : "image_3.png";
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image:  DecorationImage(
        image: AssetImage("assets/icons/$image"),
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Best course for IT and Engineering',
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            softWrap: false,
            style: TextStyle(
                color: AppColors.primaryElementText,
                fontWeight: FontWeight.bold,
                fontSize: 11.sp),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'Flutter best course',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp),
        )
      ],
    ),
  );
}
