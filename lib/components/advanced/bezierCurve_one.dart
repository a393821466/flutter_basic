import 'package:flutter/material.dart';

// 贝塞尔曲线简单案例
class BezierCurveOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('贝塞尔曲线1'),
          elevation: 0.0,
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(
          children: <Widget>[
            // 裁切控件
            ClipPath(
              clipper: BottomCliper(),
              child: Container(
                color: Colors.lightBlue,
                height: 240.0,
              ),
            )
          ],
        ));
  }
}

// 继承
class BottomCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // 生成贝塞尔曲线点位置
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControllPoint = Offset(size.width / 2, size.height);
    var firstEndControllPoint = Offset(size.width, size.height - 50);
    // 生成二次贝塞尔曲线
    path.quadraticBezierTo(firstControllPoint.dx, firstControllPoint.dy,
        firstEndControllPoint.dx, firstEndControllPoint.dy);
    // 贝塞尔路劲
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);

    return path;
  }

  // 复写方法
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
