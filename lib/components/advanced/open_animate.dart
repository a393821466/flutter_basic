import 'package:flutter/material.dart';
import '../../main.dart';

// 开场动画
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// 继承方法
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // 控制动画和时间
  AnimationController _controller;
  // 控制动画
  Animation _animation;

  @override
  void initState() {
    super.initState();
    // 初始化
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    // 监听事件(动画状态)
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 跳转到下一页，结束上一页的动画
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyApp()),
            (route) => route == null);
      }
    });
    // 播放动画
    _controller.forward();
  }

  // 销毁
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 过度透明动画控件
    return FadeTransition(
      opacity: _animation,
      child: Image.asset('images/bg.png', fit: BoxFit.cover, scale: 2.0),
      // child: Image.network(
      //     'http://b-ssl.duitang.com/uploads/item/201702/05/20170205203538_FdaP4.jpeg',
      //     fit: BoxFit.cover,
      //     scale: 2.0),
    );
  }
}

// 跳转到的页面
// class GoHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('首页')),
//         body: Center(
//           child: Container(
//             child: Text('这个是首页'),
//           ),
//         ));
//   }
// }
