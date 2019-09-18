import 'dart:ui' as prefix0;
import 'package:flutter/material.dart';

// 毛玻璃效果
class Frosted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('毛玻璃效果'),
        ),
        body: Stack(
          children: <Widget>[
            // 约束性盒子组件，添加额外的约束条件
            ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Image.asset(
                    'images/banner1.jpg')),
            Center(
              // 可裁切的矩形
              child: ClipRect(
                // 背景过滤器
                child: BackdropFilter(
                  filter: prefix0.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 500.0,
                      height: 240.0,
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Center(
                        child: Text('啦啦',
                            style: Theme.of(context).textTheme.display2),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
