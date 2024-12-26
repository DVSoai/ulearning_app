import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/base_text_widget.dart';

AppBar buildAppBarSettings() {
  return AppBar(
    elevation: 0,
    title: customText('Settings', fontSize: 18.sp),
  );
}

Widget settingsButton(BuildContext context, void Function()? onTap) {
  return   GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Confirm Logout'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: onTap,
                  child: const Text('Confirm'),
                ),
              ],
            )
          ],
        );
      });
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/icons/logout.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    ),
  );
}