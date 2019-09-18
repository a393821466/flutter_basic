import 'package:flutter/material.dart';
import 'package:flutter_t1/utils/outher_json.dart';

class OutherPage extends StatefulWidget {
  final String title;
  OutherPage({Key key, @required this.title}) : super(key: key);
  _OutherPageState createState() => _OutherPageState();
}

class _OutherPageState extends State<OutherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView(
          children: outherNum.map((item) {
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => item['routerLink'])),
            );
          }).toList(),
        ),
      ),
    );
  }
}
