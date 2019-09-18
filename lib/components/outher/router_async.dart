import 'package:flutter/material.dart';

// 返回页面传参
class RouterAsync extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('页面跳转返回数据')),
        body: Center(
          child: RouterButton(),
        ));
  }
}

// 按钮点击操作
class RouterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigatorToTakeExpress(context);
      },
      child: Text('走起'),
    );
  }

  // 异步请求处理
  _navigatorToTakeExpress(BuildContext context) async {
    final res = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExpressListView()));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$res')));
  }
}

// 页面返回
class ExpressListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('快递柜')),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('衣服'),
                onPressed: () {
                  // 返回上一个页面，并且返回值
                  Navigator.pop(context, '这是一件夏天的衣服');
                },
              ),
              RaisedButton(
                child: Text('裤子'),
                onPressed: () {
                  Navigator.pop(context, '这是一件夏天的裤子');
                },
              )
            ],
          ),
        ));
  }
}
