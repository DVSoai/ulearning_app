import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String message,
  Color backgroundColor = Colors.blueAccent,
  Color textColor = Colors.white,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}
