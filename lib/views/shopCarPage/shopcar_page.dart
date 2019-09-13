import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../../store/shop_car_store.dart';

class ShopCarPage extends StatefulWidget {
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  List<String> testList = [];

  @override
  void initState() {
    _show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: testList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(testList[index]));
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              _add();
            },
            child: Text('增加'),
            color: Colors.lightBlue,
          ),
          RaisedButton(
            onPressed: () {
              _del();
            },
            child: Text('清空'),
            color: Colors.red,
          )
        ],
      ),
    );
  }

  // 增加
  _add() async {
    // 初始化
    print('>>>>>>>>>>>>>>>>>>>>>我进了这里了');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 申明一个字符串变量
    String temp = '我爱你啊啊啊啊';
    // 把temp添加到变量里
    testList.add(temp);
    print(testList);
    // 增加到持久化
    prefs.setStringList('testInfo', testList);
    _show();
  }

  // 查询
  _show() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('testInfo') != null) {
      setState(() {
        testList = prefs.getStringList('testInfo');
      });
    }
  }

  // 删除
  _del() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //   // 删除所有 prefs.clear();
    //   // 移除key值
    prefs.remove('testInfo');
    setState(() {
      testList = [];
    });
  }
}
