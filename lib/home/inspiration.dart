import 'package:cornucopia_flutter/config/theme_colors.dart';
import 'package:cornucopia_flutter/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///灵感
class Inspiration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InspirationState();
}

class InspirationState extends State<Inspiration> {

  ///GridView,根据设置的item的个数，在屏幕宽范围内进行宽度平分。
  Widget gridDemo1 = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.0),
      itemCount: 8,
      itemBuilder: (context, index) {
        Color color_one = Colors.blue;
        Color color_two = Colors.red;
        if (index % 2 == 0) {
          return Container(
            color: color_one,
          );
        } else {
          return Container(
            color: color_two,
          );
        }
      });
  ///GridView,根据设置item最大宽度，在屏幕宽范围内进行平铺
  Widget gridDemo2 = GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2.0),
      itemCount: 8,
      itemBuilder: (context, index) {
        Color color_one = Colors.blue;
        Color color_two = Colors.red;
        if (index % 2 == 0) {
          return Container(
            color: color_one,
          );
        } else {
          return Container(
            color: color_two,
          );
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Container(
        color: ThemeColors.bgColor,
        padding: new EdgeInsets.only(
            top: UiUtils.getStatusBarHeight(context), left: 16.0, right: 16.0),
        child: gridDemo2,
      ),
    ));
  }
}
