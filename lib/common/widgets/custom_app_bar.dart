

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final bool? isShowLeading;
  final String? text;

  const CustomAppBar({super.key, this.leading, this.actions, this.text, this.isShowLeading = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isShowLeading ?? false,  // Safely check for null
      leading: leading,
      actions: actions ?? [], // Provide an empty list if actions are null
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          height: 1.0,
          color: AppColors.primarySecondaryBackground,
        ),
      ),
      flexibleSpace: Center(
        child: Text(
          text ?? '',  // Provide an empty string if text is null
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


