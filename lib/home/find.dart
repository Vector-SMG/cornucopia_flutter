import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///发现
class Find extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FindState();
}

class FindState extends State<Find> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ConstrainedBox(
      constraints: BoxConstraints.expand(),
    ));
  }
}
