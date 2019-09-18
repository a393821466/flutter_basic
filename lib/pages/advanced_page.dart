import 'package:flutter/material.dart';
import 'package:flutter_t1/utils/advanced_json.dart';

class AdvancedPage extends StatefulWidget {
  final String title;
  AdvancedPage({Key key, @required this.title}) : super(key: key);

  _AdvancedPageState createState() => _AdvancedPageState();
}

class _AdvancedPageState extends State<AdvancedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: Container(
        child: ListView(
          children: advancedCom.map((item) {
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
