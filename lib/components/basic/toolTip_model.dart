import 'package:flutter/material.dart';

// 轻量级弹窗
class ToolTipModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('轻弹')),
        body: Center(
          child: Tooltip(
            message: '撒哇哇',
            child: Image.asset('images/bg.png'),
          ),
        ));
  }
}
