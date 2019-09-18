import 'package:flutter/material.dart';

// 层叠
class StackView extends StatelessWidget {
  @override
  var stack = new Stack(
    // 内部元素的对其方式
    // alignment: FractionalOffset(0.5, 0.8),
    children: <Widget>[
      CircleAvatar(
        backgroundImage: AssetImage('images/bg.png'),
        radius: 100.0,
      ),
      // Container(
      //   decoration: BoxDecoration(color: Colors.lightBlue),
      //   padding: EdgeInsets.all(5.0),
      //   child: Text('我爱你'),
      // )
      // 使用positioned没必要使用alignment
      Positioned(
        top: 50.0,
        left: 80.0,
        child: Text(
          '我爱你',
          style: TextStyle(color: Colors.white),
        ),
      ),
      new Positioned(
        bottom: 50.0,
        right: 80.0,
        child: Text(
          '我恨你',
          style: TextStyle(color: Colors.white),
        ),
      )
    ],
  );
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('层叠')),
        body: Center(
          child: stack,
        ));
  }
}
