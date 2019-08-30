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
      body: Center(
        child: Text('${widget.title}'),
      ),
    );
  }
}
