import 'package:flutter/material.dart';

// 第一个页面
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text('firstPage',
              style: TextStyle(fontSize: 28.0, color: Colors.white)),
          backgroundColor: Colors.yellow,
          elevation: 0.0,
        ),
        body: Center(
          child: MaterialButton(
            child: Icon(Icons.navigate_next, color: Colors.black, size: 36.0),
            onPressed: () {
              // 路由跳转
              Navigator.of(context).push(CustemRouter(SecondPage()));
            },
          ),
        ));
  }
}

// 第二个页面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: Text('sadwsxx',
              style: TextStyle(fontSize: 28.0, color: Colors.white)),
          elevation: 0.0,
          backgroundColor: Colors.pinkAccent,
          leading: Container(),
        ),
        body: Center(
          child: MaterialButton(
            child: Icon(Icons.navigate_before, color: Colors.black, size: 36.0),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ));
  }
}

// 继承PageRouteBulder
class CustemRouter extends PageRouteBuilder {
  final Widget widget;
  // 定义构造方法
  CustemRouter(this.widget)
      : super(
            // 过渡时间
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              // 渐变效果
              // return FadeTransition(
              //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              //       parent: animation1, curve: Curves.fastOutSlowIn)),
              //   child: child
              // );
              // 缩放
              // return ScaleTransition(
              //     scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              //         parent: animation1, curve: Curves.fastOutSlowIn)),
              //     child: child);
              // 旋转缩放
              // return RotationTransition(
              //     turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              //         parent: animation1, curve: Curves.fastOutSlowIn)),
              //     child: ScaleTransition(
              //         scale: Tween(begin: 0.0, end: 1.0).animate(
              //             CurvedAnimation(
              //                 parent: animation1, curve: Curves.fastOutSlowIn)),
              //         child: child));
              // 滑动
              return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.easeOutQuint)),
                child: child,
              );
            });
}
