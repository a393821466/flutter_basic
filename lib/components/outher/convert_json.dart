import 'package:flutter/material.dart';
import 'dart:convert';


class ConvertJsons extends StatefulWidget {
  @override
  _ConvertJsonsState createState() => _ConvertJsonsState();
}

class _ConvertJsonsState extends State<ConvertJsons> {
  final post={
    'title':'heelo',
    'des':'nice to meet you.'
  };
  String formartText='';
  Map formartMap={};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('解析json数据')
      ),
      body:Center(
        child: Column(
          children: <Widget>[
            SizedBox(height:30),
            Text('数据:$post,类型为Map(${post is Map})'),
            Text('----------------------------'),
            Text('数据:$formartText,类型为Map(${formartText is Map})'),
            RaisedButton(
              child: Text('转换成json字符串'),
              onPressed: (){
                // 解析成json字符串（提交数据到后端可以使用）
                final formartData=json.encode(post);
                setState(() {
                  formartText=formartData;
                });
              },
            ),
            Text('数据:$formartMap,类型为Map(${formartMap is Map})'),
            RaisedButton(
              child: Text('转换成Map'),
              onPressed: (){
                 // 把数据转换成map类型数据
                final postJsonConvert=json.decode(formartText);
                setState(() {
                  formartMap=postJsonConvert;
                });
              },
            )
          ],
        )
      )
    );
  }
}