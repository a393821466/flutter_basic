import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  // 不带标签的浮动按钮
  final Widget _floatingButtonAction = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0,
    backgroundColor: Colors.lightBlue,
    // shape: BeveledRectangleBorder(  //改变形状
    //   borderRadius: BorderRadius.circular()
    // ),
  );
  // 带标签的浮动按钮
  // final Widget _floatngActionButtonExtend = FloatingActionButton.extended(
  //   onPressed: () {},
  //   icon: Icon(Icons.add),
  //   label: Text('add'),
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('浮动按钮'),
      ),
      body: Center(),
      floatingActionButton: _floatingButtonAction,
    );
  }
}
