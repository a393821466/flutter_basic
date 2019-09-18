import 'package:flutter/material.dart';

class TopNavigatorIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=>Navigator.pop(context),
          tooltip: 'menu',
        ),
        title: Text('顶部状态栏'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('search');
            },
            tooltip: 'search',
          )
        ],
      ),
      body:Center(
        child: Text('基础顶部状态栏'),
      )
    );
  }
}