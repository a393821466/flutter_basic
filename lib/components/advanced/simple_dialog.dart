import 'package:flutter/material.dart';
import 'dart:async';

enum Option { A, B, C }

// 简单的对话框
class SimpleDialogBox extends StatefulWidget {
  @override
  _SimpleDialogBoxState createState() => _SimpleDialogBoxState();
}

class _SimpleDialogBoxState extends State<SimpleDialogBox> {
  String _dialogText = '';
  // 点击打开对话框方法
  Future _openStartDialog() async {
    final options = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('simpleDialog'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('optionA'),
              onPressed: () => Navigator.pop(context, Option.A),
            ),
            SimpleDialogOption(
              child: Text('optionB'),
              onPressed: () => Navigator.pop(context, Option.B),
            ),
            SimpleDialogOption(
              child: Text('optionC'),
              onPressed: () => Navigator.pop(context, Option.C),
            )
          ],
        );
      },
    );
    switch (options) {
      case Option.A:
        setState(() {
          _dialogText = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _dialogText = 'B';
        });
        break;
      default:
        setState(() {
          _dialogText = 'C';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简单的对话框'),
      ),
      body: Container(
        child: Text('Your checkBox is:$_dialogText'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openStartDialog,
      ),
    );
  }
}
