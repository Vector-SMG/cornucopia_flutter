
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum StatusBarColor { DARK, LIGHT }

///UI工具类
class UiUtils {
  ///设置状态栏颜色，主要分为暗黑和明亮两种style
  static void setStatusBarColor(StatusBarColor statusBarColor) {
      switch (statusBarColor.index) {
        case 0:
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
          break;
        case 1:
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
          break;
      }
  }

  ///获取状态栏高度
  static double getStatusBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  ///获取屏幕宽度
  static double getScreanWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
