import 'package:flutter/material.dart';

// 单个手风琴效果
class SingleEXpansionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTile'),
      ),
      body: Container(
        child: ExpansionTile(
          // 标题
          title: Text('标题'),
          // 左边图标
          leading: Icon(Icons.ac_unit),
          // 打开之后的颜色
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              // 子标题
              title: Text('list title'),
              // 子内容
              subtitle: Text('chidren text'),
            )
          ],
          // 默认打开
          initiallyExpanded: true,
        ),
      ),
    );
  }
}
