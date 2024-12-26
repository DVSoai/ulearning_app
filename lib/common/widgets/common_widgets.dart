import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/values/colors.dart';

AppBar buildAppBar(BuildContext context, String text) {
  return AppBar(
    // automaticallyImplyLeading: showBackButton,
    // leading: showBackButton ? IconButton(
    //   icon: const Icon(Icons.arrow_back_ios),
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    // ) : null,
    actions: const [

    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        height: 1.0,
        color: AppColors.primarySecondaryBackground,
      ),
    ),
    flexibleSpace: Center(
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google"),
        _reusableIcons("facebook"),
        _reusableIcons("apple"),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 14.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget reusableTextField(String hintText, String textType, String iconName,
    void Function(String value)? func,{ bool isPassword = false,  bool showPassword = false ,Function()? toggleShowPassword})  {
  return Container(
    width: 325.w,
    height: 60.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 15.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 289.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: isPassword
                    ? IconButton(
                  onPressed: toggleShowPassword!,
                  icon: Icon(
                    showPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
                    : null,
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
            // obscureText: textType == "Password" ? true : false,
            obscureText: isPassword && !showPassword,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 5.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 12.sp,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName,void Function()? func,{bool primary = true}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 60.h,
      margin: EdgeInsets.only(left: 5.w,right: 5.w, top: primary ? 30.h: 20.h),
      decoration: BoxDecoration(
          color: primary? AppColors.primaryElement: AppColors.primaryBackground,
          border: Border.all(color:primary? Colors.transparent : AppColors.primaryFourElementText),
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1)
            )
          ]

      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: primary ? AppColors.primaryBackground: AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    ),
  );
}
