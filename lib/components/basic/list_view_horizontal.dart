import 'package:flutter/material.dart';

// 横向列表组件
class ListViewHor extends StatelessWidget {
  @override
  List<Widget> _Getlist() {
    List<Widget> _list = new List();
    for (var i = 0; i < 20; i++) {
      _list.add(Container(
        width: 200.0,
        child: ListTile(leading: Icon(Icons.dashboard), title: Text('拉拉4')),
      ));
    }
    return _list;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('横向列表')),
        body: Container(
          height: 150.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: this._Getlist(),
          ),
        ));
  }
}
