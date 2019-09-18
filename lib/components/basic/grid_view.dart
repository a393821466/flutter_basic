import 'package:flutter/material.dart';

// 网格布局
class GridViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('网格列表'),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.7),
          children: <Widget>[
            new Image.asset(
                'images/banner1.jpg',
                fit: BoxFit.cover),
            new Image.asset(
                'images/banner2.jpg',
                fit: BoxFit.cover),
            new Image.asset(
                'images/banner3.jpg',
                fit: BoxFit.cover),
            new Image.asset(
                'images/banner4.jpg',
                fit: BoxFit.cover),
            new Image.asset(
                'images/banner5.jpg',
                fit: BoxFit.cover),
            new Image.asset(
                'images/banner6.jpg',
                fit: BoxFit.cover),
            new Image.asset(
                'images/banner1.jpg',
                fit: BoxFit.cover),
            new Image.asset(
                'images/banner2.jpg',
                fit: BoxFit.cover),
            new Image.asset(
                'images/banner3.jpg',
                fit: BoxFit.cover),
          ],
        ));
  }
}
