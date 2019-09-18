import 'package:flutter/material.dart';

// 流式布局
class WrapView extends StatefulWidget {
  @override
  _WrapViewState createState() => _WrapViewState();
}

class _WrapViewState extends State<WrapView> {
  List<Widget> list;
  // 初始化list
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕的宽度
    final width = MediaQuery.of(context).size.width;
    // 获取屏幕的高度
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(title: Text('Wrap流式布局')),
        body: Center(
          child: Opacity(
            opacity: 0.8,
            child: Container(
              width: width,
              height: height / 2,
              color: Colors.black26,
              child: Wrap(
                children: list,
                spacing: 26.0, // 流式布局间距
              ),
            ),
          ),
        ));
  }

  // 点击添加
  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 9) {
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.grey,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  // 放置照片
  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.yellow,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}
