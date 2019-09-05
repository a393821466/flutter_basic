import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  final String title;
  InformationPage(this.title);
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
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