import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('页面视图'),
        ),
        body:PageView(
          // pageSnapping: false,
          // reverse: true, //倒过来
          scrollDirection: Axis.horizontal, //水平滚动
          onPageChanged: (currentPage){ // 方法
            print(currentPage);
          },
          controller: PageController(
            initialPage: 1, // 默认为1页面
            keepPage: false, //不记录用户滚动位置
            // viewportFraction: 0.85 //页面占比
          ),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Icon(Icons.account_circle,size:40,color:Colors.white),
            color:Colors.grey[600]
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(Icons.person,size:40,color:Colors.white),
            color:Colors.yellow[600]
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(Icons.attach_money,size:40,color:Colors.white),
            color:Colors.red[600]
          ),
        ],
      )
    );
  }
}