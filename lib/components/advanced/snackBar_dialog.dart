import 'package:flutter/material.dart';

//操作提示栏
class SnackBarDialog extends StatefulWidget {
  @override
  _SnackBarDialogState createState() => _SnackBarDialogState();
}

class _SnackBarDialogState extends State<SnackBarDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('操作提示栏')),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SnackBarButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Open SnackBar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('loading...'),
          action: SnackBarAction(
            label: '确认',
            onPressed: () {},
          ),
        ));
      },
    );
  }
}
