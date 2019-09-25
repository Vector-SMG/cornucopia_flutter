import 'package:cornucopia_flutter/entry/login.dart';
import 'package:cornucopia_flutter/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  ///修改状态栏颜色
  runApp(MyApp());
  UiUtils.setStatusBarColor(StatusBarColor.LIGHT);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:Colors.blue,
        ///将顶部导航栏或者状态栏颜色修改为黑色或白色
        primaryColor: Colors.white
      ),
      routes: {"/": (context) => Login()},
    );
  }
}

