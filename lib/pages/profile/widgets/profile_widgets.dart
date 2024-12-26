import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widget.dart';

typedef SettingModel = ({String icon, String title, Function() onTap});

AppBar buildAppBarProfile() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 18.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          customText('Profile', fontSize: 18.sp),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset('assets/icons/more_vertical.png'),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        image: AssetImage('assets/icons/headpic.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage('assets/icons/edit_3.png'),
    ),
  );
}

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      // _itemsListView('settings', 'Settings', (){}),
      ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.settings),
                child: Container(
                  padding: EdgeInsets.only(bottom: 15.h, top: 15.h),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        padding: const EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Image.asset(
                            "assets/icons/${imagesInfo.values.elementAt(index)}"),
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Text(
                        imagesInfo.keys.elementAt(index),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ))
    ],
  );
}

Widget buildUserAvatar() {
  return SizedBox(
      width: 100,
      height: 100,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          fit: StackFit.expand,
          children: [
            // controller.currentUser!.avatar.isEmpty
            //     ? Initicon(
            //     text: controller.currentUser!.fullName, elevation: 4)
            //     : ClipOval(
            //   child: CachedNetworkImage(
            //       fit: BoxFit.cover,
            //       imageUrl: controller.currentUser!.avatar),
            // ),
            ClipOval(
              child: Image.asset(
                'assets/icons/headpic.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 4.w,
              bottom: 2.w,
              child: Image(
                width: 30.w,
                height: 30.h,
                image: const AssetImage('assets/icons/edit_3.png'),
              ),
            )
          ],
        ),
      ));
}

//C1
Widget _itemsListView(String iconName, String title, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Image(
              image: AssetImage('assets/icons/$iconName.png'),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    ),
  );
}

//C2
var imagesInfo = <String, String>{
  'Settings': 'settings.png',
  'Payment details': 'credit-card.png',
  'Achievement': 'award.png',
  'Love': 'heart_1.png',
  'Reminders': 'cube.png',
};
