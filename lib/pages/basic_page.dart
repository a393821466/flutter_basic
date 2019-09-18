import 'package:flutter/material.dart';
import 'package:flutter_t1/utils/basic.json.dart';

class BasicPage extends StatefulWidget {
  final String title;
  BasicPage({Key key, @required this.title}) : super(key: key);

  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: Container(
        child: ListView(
          children: comBasic.map((item) {
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
