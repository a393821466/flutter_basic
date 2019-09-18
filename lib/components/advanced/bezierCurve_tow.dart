import 'package:flutter/material.dart';

// 波浪贝尔曲线实现
class BezierCurveTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('贝塞尔曲线2'),
          elevation: 0.0,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Column(
          children: <Widget>[
            // 裁切控件
            ClipPath(
              clipper: BottomCliperTilp(),
              child: Container(
                color: Colors.deepPurpleAccent,
                height: 240.0,
              ),
            )
          ],
        ));
  }
}

// 实现方法
class BottomCliperTilp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // 第一个点
    path.lineTo(0, 0);
    // 第二个点
    path.lineTo(0, size.height - 40);
    // 第一个贝塞尔点开始
    var firstCustomLine = Offset(size.width / 4, size.height);
    // 第一个贝塞尔点结束
    var firstCustomLine2 = Offset(size.width / 2.2, size.height - 30);
    // 绘制第一条贝塞尔曲线
    path.quadraticBezierTo(firstCustomLine.dx, firstCustomLine.dy,
        firstCustomLine2.dx, firstCustomLine2.dy);
    // 第二个贝塞尔点开始
    var secountCurstomLine = Offset(size.width / 4 * 3, size.height - 90);
    // 第二个贝塞尔点结束
    var secountCurstomLine2 = Offset(size.width, size.height - 30);
    // 绘制第二条贝塞尔曲线
    path.quadraticBezierTo(secountCurstomLine.dx, secountCurstomLine.dy,
        secountCurstomLine2.dx, secountCurstomLine2.dy);
    // 贝塞尔倒数第二个点
    path.lineTo(size.width, size.height - 40);
    // 贝塞尔原点
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
