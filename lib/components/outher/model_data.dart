import 'package:flutter/material.dart';
import 'dart:convert';

class ModelClassJson extends StatefulWidget {
  @override
  _ModelClassJsonState createState() => _ModelClassJsonState();
}

class _ModelClassJsonState extends State<ModelClassJson> {
  final das = {'title': '你好', 'des': '我一点都不好'};
  var getPostText;
  @override
  void initState() {
    getPostText = Post.fromJson(das);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('model类处理数据'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text('转换成post类型'),
            Text('title:${getPostText.title},des:${getPostText.des}'),
            Divider(height: 1, indent: 10, color: Colors.grey[200]),
            Text('转换成Map类型'),
            Text(json.encode(getPostText)),
          ],
        )));
  }
}

class Post {
  final String title;
  final String des;
  // 构造函数
  Post(this.title, this.des);

  // 构造方法，接收一个map数据，然后转换成Post
  Post.fromJson(Map json)
      : title = json['title'],
        des = json['des'];
  // 如果需要返回map类型的数据
  Map toJson() => {'title': title, 'des': des};
}
