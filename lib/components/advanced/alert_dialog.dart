import 'package:flutter/material.dart';
import 'dart:async';

enum Option { cancel, confirm }

// 对话框
class AlertDialogBox extends StatefulWidget {
  @override
  _AlertDialogBoxState createState() => _AlertDialogBoxState();
}

class _AlertDialogBoxState extends State<AlertDialogBox> {
  @override
  var checkText = '';

  _openSimpleDialog(String str) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('$str'),
          children: <Widget>[],
        );
      },
    );
  }

  Future _onOpenDialog() async {
    final showAlerts = await showDialog(
      context: context,
      // barrierDismissible: false, // 强制点击按钮关闭
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('alertDialog'),
          content: Text('are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.pop(context, Option.cancel),
            ),
            FlatButton(
              child: Text('确认'),
              onPressed: () => Navigator.pop(context, Option.confirm),
            )
          ],
        );
      },
    );
    switch (showAlerts) {
      case Option.cancel:
        setState(() {
          checkText = 'cancel';
        });
        _openSimpleDialog('您点击了$checkText');
        break;
      default:
        setState(() {
          checkText = 'confirm';
        });
        _openSimpleDialog('您点击了$checkText');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提示对话框'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('点击打开对话框'),
                onPressed: _onOpenDialog,
              )
            ],
          ),
        ),
      ),
    );
  }
}
