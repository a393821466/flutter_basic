import 'package:flutter/material.dart';

// 可滚动的Tabbar,
class MyTabNavigator extends StatefulWidget {
  @override
  _myTabNavigatorState createState() => _myTabNavigatorState();
}

class _myTabNavigatorState extends State<MyTabNavigator> {
  final List<Tab> tabList = <Tab>[
    Tab(text: '明教'),
    Tab(text: '霸刀'),
    Tab(text: '天策'),
    Tab(text: '纯阳'),
    Tab(text: '少林'),
    Tab(text: '藏剑'),
    Tab(text: '七秀'),
    Tab(text: '五毒')
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
          appBar: AppBar(
              title: TabBar(
            tabs: tabList,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            // indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            labelColor: Colors.white,
            isScrollable: true,
          )),
          body: TabBarView(
            children: tabList.map((f) {
              return new Center(child: Text(f.text));
            }).toList(),
          )),
    );
  }
}
