import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  final String title;
  MyPage(this.title);
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}')),
      body: Center(
        child: Text('${widget.title}'),
      ),
    );
  }
}
