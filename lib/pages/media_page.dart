import 'package:flutter/material.dart';
import 'package:flutter_t1/utils/media_json.dart';
class MediaPage extends StatefulWidget {
  final String title;
  MediaPage({Key key, @required this.title}) : super(key: key);
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
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
          children: mediaNum.map((item) {
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
