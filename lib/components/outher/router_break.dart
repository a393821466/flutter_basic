import 'package:flutter/material.dart';

// 路由跳转
class RoutePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('路由')),
        body: Center(
          child: RaisedButton(
            child: Text('查看'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => secountPage()));
            },
          ),
        ));
  }
}

class secountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('拉阿鲁')),
        body: Center(
          child: Container(
            child: RaisedButton(
              child: Text('返回上一页'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ));
  }
}
