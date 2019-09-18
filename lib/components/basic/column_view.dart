import 'package:flutter/material.dart';

// 垂直布局
class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('垂直布局'),
        ),
        body: Center(
          child: Column(
            // 副轴
            crossAxisAlignment: CrossAxisAlignment.center,
            // 主轴
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height:60,
                decoration: BoxDecoration(
                  color:Colors.blue
                ),
              ),
              Expanded(
                child: Container(
                decoration: BoxDecoration(
                  color:Colors.yellow
                ),
              ),
              ),
              Container(
                height:60,
                decoration: BoxDecoration(
                  color:Colors.red
                ),
              ),
            ],
          ),
        ));
  }
}
