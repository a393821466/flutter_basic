import 'package:flutter/material.dart';

// 动态列表
class ListApp extends StatelessWidget {
  final items = new List<String>.generate(100, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('竖向列表2')),
      body: Container(
        child: DymainList(items: items),
      ),
    );
  }
}

class DymainList extends StatelessWidget {
  final List<String> items;
  DymainList({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(title: Text('${items[index]}'));
      },
    );
  }
}
