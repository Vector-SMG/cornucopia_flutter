import 'package:cornucopia_flutter/config/theme_colors.dart';
import 'package:cornucopia_flutter/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///个人中心
class Me extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MeState();
}

class MeState extends State<Me> {

  @override
  Widget build(BuildContext context) {

    ///顶部导航栏
    Widget navigationBar = Row(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: Row(
                  children: <Widget>[
                    Image.asset("images/flame.png",
                        width: 15, height: 15, fit: BoxFit.contain),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 100
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "378.66",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset(
            "images/settings.png",
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        )
      ],
    );

    ///个人信息
    Widget personInfo = Row(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: ClipOval(
                  ///todo https://www.jianshu.com/p/c2a17d21c19b
                  child: Image.asset(
                    "images/avstar.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child: Align(
                        child: Text(
                          "瓦里安·乌瑞恩",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        alignment: Alignment.centerLeft,
                      )),
                      Expanded(
                          child: Align(
                        child: Text(
                          "瓦里安·乌瑞恩是暴风城的国王和联盟军队的指挥官。在他年少时期，兽人入侵艾泽拉斯，与暴风城人类发生战争，史称兽人第一次战争。最终暴风城被兽人部落攻破，瓦里安·乌瑞恩的父亲，时任国王莱恩遭刺杀身亡，暴风城将军安度因·洛萨携瓦里安逃往洛丹伦寻求援助",
                          style: TextStyle(
                              color: ThemeColors.subordinateColor,
                              fontSize: 12.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        alignment: Alignment.centerLeft,
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        new Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFFD5D8EA),
          size: 12.0,
        )
      ],
    );

    ///创建其他信息的列item
    Expanded _buildOtherInfoColumn(
        String value, String label, Color valueColor, Color dividerColor) {
      return new Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Expanded(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: valueColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ThemeColors.subordinateColor, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              VerticalDivider(
                width: 1.0,
                indent: 10.0,
                endIndent: 10.0,
                color: dividerColor,
              )
            ],
          ));
    }

    ///其他信息
    Widget otherInfo = Container(
      margin: EdgeInsets.only(top: 16.0),
      height: 50.0,
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildOtherInfoColumn("3,527", "粉丝", ThemeColors.themeColor,
              ThemeColors.subordinateColor),
          _buildOtherInfoColumn(
              "86969", "作品", Colors.black, ThemeColors.subordinateColor),
          _buildOtherInfoColumn("73", "关注", Colors.black, ThemeColors.bgColor),
        ],
      ),
    );

    Widget galleryItemBuilder = Container(
      margin: EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset("images/avstar.jpg",
            width: 100, height: 80, fit: BoxFit.cover),
      ),
    );

    ///图库
    Widget gallery = Container(
      margin: EdgeInsets.only(top: 16.0),
      height: 80.0,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return galleryItemBuilder;
        },
        itemCount: 20,
        scrollDirection: Axis.horizontal,
      ),
    );

    ///我的点赞，我的收藏等
    Widget _buildOwnInfoExpanded(IconData iconData, String title) {
      return Container(
        height: 30.0,
        margin: EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.horizontal,
                children: <Widget>[
                  new Icon(
                    iconData,
                    color: Colors.black,
                    size: 20,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16.0),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            new Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFD5D8EA),
              size: 12.0,
            )
          ],
        ),
      );
    }

    ///我的信息
    Widget ownInfo = Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          _buildOwnInfoExpanded(Icons.favorite_border, "我的点赞"),
          _buildOwnInfoExpanded(Icons.star_border, "我的收藏")
        ],
      ),
    );

    return Scaffold(
        body: ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Container(
          color: ThemeColors.bgColor,
          padding: new EdgeInsets.only(
              top: UiUtils.getStatusBarHeight(context),
              left: 16.0,
              right: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                navigationBar,
                personInfo,
                otherInfo,
                gallery,
                ownInfo
              ],
            ),
          )),
    ));
  }
}
