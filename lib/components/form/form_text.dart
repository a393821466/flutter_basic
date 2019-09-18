import 'package:flutter/material.dart';

// 文本字段
class FormTextColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.grey[500],
      ),
      child: FormTextSingle(),
    ));
  }
}

class FormTextSingle extends StatefulWidget {
  _FormTextSingleState createState() => _FormTextSingleState();
}

class _FormTextSingleState extends State<FormTextSingle> {
  final TextEditingController textEditingController =
      TextEditingController(); // 文本框控制器

  @override
  void dispose() {
    // 使用完后销毁
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // 控制器监听方法
    super.initState();
    textEditingController.addListener(() {
      print('input:${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('文本字段'),
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: textEditingController, //使用控制器
                  // onChanged: (value) {
                  //   print(value + '-');
                  // }, // 每次变化触发
                  onSubmitted: (value) {
                    print(value + '--');
                  }, // 按下的时候触发
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: 'username',
                    hintText: 'Please int context',
                    // border:InputBorder.none // 隐藏边框
                    // border:OutlineInputBorder() // 四周添加边框
                    filled: true, // 背景颜色
                  ),
                ),
              ],
            )));
  }
}
