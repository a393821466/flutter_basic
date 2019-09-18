import 'package:flutter/material.dart';
import 'package:flutter_t1/utils/form_json.dart';

class FormPages extends StatefulWidget {
  final String title;
  FormPages({Key key, @required this.title}) : super(key: key);
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPages> {
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
          children: formList.map((item) {
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
