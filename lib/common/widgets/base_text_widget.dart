
import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/values/colors.dart';

Widget customText(String text, {Color color = AppColors.primaryText, double fontSize = 16, FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}