import 'package:flutter/material.dart';

class PopupMenuButtonWidget extends StatefulWidget {
  @override
  _PopupMenuButtonWidgetState createState() => _PopupMenuButtonWidgetState();
}

class _PopupMenuButtonWidgetState extends State<PopupMenuButtonWidget> {
  var currentIndex = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹出式菜单'),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(currentIndex),
              PopupMenuButton(
                onSelected: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'home',
                        child: Text('home'),
                      ),
                      PopupMenuItem(
                        value: 'detail',
                        child: Text('detail'),
                      ),
                      PopupMenuItem(
                        value: 'settings',
                        child: Text('settings'),
                      )
                    ],
              ),
            ],
          )
        ],
      ),
      body: Container(
        child: Text('弹出式菜单'),
      ),
    );
  }
}
