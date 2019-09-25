import 'package:cornucopia_flutter/config/theme_colors.dart';
import 'package:cornucopia_flutter/home/home.dart';
import 'package:cornucopia_flutter/utils/toast.dart';
import 'package:cornucopia_flutter/utils/ui_utils.dart';
import 'package:flutter/material.dart';

///登录界面
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  ///默认边框颜色
  int _defaultBorderColorOfInput = 0xFFEDEFF2;

  ///获取焦点时候边框颜色
  int _focusBorderColorOfInput = 0xFFBEC9DE;

  ///输入框hint文字颜色
  int _hintTextFieldColor = 0xFFC5C6CE;

  ///用户名控制器
  TextEditingController _unameController = TextEditingController();

  ///密码控制器
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    Widget welcomeSection = Text(
      "欢迎来到Cornucopia",
      style: TextStyle(fontSize: 28),
    );

    Widget userNameTextField = TextField(
      cursorColor: Color(_focusBorderColorOfInput),
      cursorWidth: 1,
      autofocus: true,
      decoration: InputDecoration(
          hintText: "手机号/用户名/邮箱",
          hintStyle: TextStyle(color: Color(_hintTextFieldColor)),
          //208 218 213
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color(_defaultBorderColorOfInput), width: 1.0)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(_focusBorderColorOfInput)),
          )),
      controller: _unameController,
    );

    Widget passwordTextFiled = TextField(
      cursorColor: Color(_focusBorderColorOfInput),
      cursorWidth: 1,
      autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "密码",
        hintStyle: TextStyle(color: Color(_hintTextFieldColor)),
        //208 218 213
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(_defaultBorderColorOfInput), width: 1.0)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(_focusBorderColorOfInput)),
        ),
      ),
      controller: _passwordController,
    );

    Widget forgetPasswordText = Text(
      "忘记密码",
      style: TextStyle(color: ThemeColors.subordinateColor, fontSize: 12),
    );

    Widget loginBtn = RaisedButton(
      onPressed: excuteLogin,
      child: Text("登录"),
      textColor: Colors.white,
      color: ThemeColors.themeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 2.0,
      highlightElevation: 8.0,
      disabledElevation: 0.0,
    );

    Widget noAccountTipText = Text(
      "还没有账号?",
      style: TextStyle(color: Color(0xFFC5C6CE), fontSize: 12),
    );

    Widget registerText = Text(
      "立即注册",
      style: TextStyle(color: Color(0xFF9EA7A9), fontSize: 12),
    );

    return new Scaffold(
        body: Container(
            padding: new EdgeInsets.only(
                left: 32,
                top: UiUtils.getStatusBarHeight(context) + 32,
                right: 32,
                bottom: 16),
            child: SingleChildScrollView(
              ///解决column overflow问题
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    welcomeSection,
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: userNameTextField,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: passwordTextFiled),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                            child: GestureDetector(
                              child: forgetPasswordText,
                              onTap: () => Toast.showWarn("点击忘记密码"),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 60),
                          child: SizedBox(
                            width: UiUtils.getScreanWidth(context) - 64,
                            height: 40,
                            child: loginBtn,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Row(
                            children: <Widget>[
                              noAccountTipText,
                              GestureDetector(
                                child: registerText,
                                onTap: () => Toast.showWarn("点击立即注册"),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
            )));
  }

  ///执行登录
  void excuteLogin() {
    String username = _unameController.text;
    String password = _passwordController.text;

    if (username != null && password != null) {
      if (username == "admin" && password == "123") {
        //跳转并关闭当前页
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return new Home();
        }), (route) => route == null);
        return;
      }
    }
    Toast.showWarn("用户名或密码错误!!!");
  }
}
