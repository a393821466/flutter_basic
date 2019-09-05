import 'package:flutter/material.dart';

class ShopCarPage extends StatefulWidget {
  final String title;
  ShopCarPage(this.title);
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}')),
      body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Text('阿斯达大所大所多'),
              SizedBox(height: 30),
              Text('阿斯达大所大所多'),
              SizedBox(height: 30),
              Text('阿斯达大所大所多'),
              SizedBox(height: 30),
              Text('阿斯达大所大所多'),
              SizedBox(height: 30),
            ],
          ),
      )
    );
  }
}
