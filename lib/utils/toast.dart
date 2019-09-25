import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart' as prefix0;

class Toast {

  ///显示报警信息
  static void showWarn(String msg) {
    showToast(msg,ToastGravity.BOTTOM, Colors.red, Colors.white, 16.0);
  }

  ///显示toast
  static void showToast(String msg, ToastGravity gravity, Color backgroundColor,
      Color textColor, double fontSize) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: prefix0.Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIos: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }
}
