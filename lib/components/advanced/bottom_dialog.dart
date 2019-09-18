import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class BottomDialogBox extends StatefulWidget {
  @override
  _BottomDialogBoxState createState() => _BottomDialogBoxState();
}

class _BottomDialogBoxState extends State<BottomDialogBox> {
  final _bottomScaffoldKey = GlobalKey<ScaffoldState>();
  // 自定义模态框
  _onBottomClickDialog() {
    _bottomScaffoldKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 16.0),
              Text('01:30/03:30'),
              Expanded(
                child: Text(
                  'dsasa',
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  // 上拉模态框
  Future _onBottomClickModelDialog() async {
    final options = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('OptionA'),
                onTap: () => Navigator.pop(context, 'A'),
              ),
              ListTile(
                  title: Text('OptionB'),
                  onTap: () => Navigator.pop(context, 'B')),
              ListTile(
                  title: Text('OptionC'),
                  onTap: () => Navigator.pop(context, 'C'))
            ],
          ),
        );
      },
    );
    print(options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomScaffoldKey,
      appBar: AppBar(
        title: Text('底部对话框'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('点击弹出底部对话框'),
                onPressed: _onBottomClickDialog,
              ),
              RaisedButton(
                child: Text('点击弹出模型对话框'),
                onPressed: _onBottomClickModelDialog,
              )
            ],
          ),
        ),
      ),
    );
  }
}
