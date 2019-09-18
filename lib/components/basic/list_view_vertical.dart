import 'package:flutter/material.dart';

// 竖向列表组件
class ListViewVer extends StatelessWidget {
  @override
  List<Widget> _Getlist() {
    List<Widget> _list = new List();
    for (var i = 0; i < 20; i++) {
      _list.add(
          new ListTile(leading: Icon(Icons.dashboard), title: Text('拉拉4')));
    }
    return _list;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('竖向列表')),
        body: Center(
          child: Container(
            child: new ListView(
              scrollDirection: Axis.vertical,
              children: this._Getlist(),
            ),
          ),
        ));
  }
}
