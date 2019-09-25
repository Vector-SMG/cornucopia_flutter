import 'package:cornucopia_flutter/config/theme_colors.dart';
import 'package:cornucopia_flutter/home/find.dart';
import 'package:cornucopia_flutter/home/inspiration.dart';
import 'package:cornucopia_flutter/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'me.dart';

///主界面
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  ///当前选中的index
  var _selectedIndex = 0;

  ///子路由集合
  final List<Widget> _children = [Find(), Find(), Inspiration(), Find(), Me()];

  ///上次点击时间
  DateTime _lastPressAt;

  ///按钮集合
  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.location_searching), title: Text("发现")),
    BottomNavigationBarItem(icon: Icon(Icons.blur_circular), title: Text("经验")),
    BottomNavigationBarItem(
        icon: Icon(Icons.lightbulb_outline), title: Text("灵感")),
    BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息")),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), title: Text("我的")),
  ];

  ///底部状态栏点击事件
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //导航栏拦截应用:点击两次，且间隔小于1秒退出
  Future<bool> _onWillPopHandle() async {
    if (_lastPressAt == null ||
        DateTime.now().difference(_lastPressAt) > Duration(seconds: 1)) {
      _lastPressAt = DateTime.now();
      Toast.showWarn("两次点击返回，且时间间隔小于1秒，才退出!");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: new Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _children,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _list,
          currentIndex: _selectedIndex,
          selectedItemColor: ThemeColors.themeColor,
          unselectedItemColor: Color(0xFFD5D8EA),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      onWillPop: _onWillPopHandle,
    );
  }
}
