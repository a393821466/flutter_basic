import 'package:flutter/material.dart';

// 固定导航，保存页面状态代码
class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

// with 后面的类为混入
class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTab = <Tab>[
    Tab(icon: Icon(Icons.home), text: '首页'),
    Tab(icon: Icon(Icons.message), text: '个人信息'),
    Tab(icon: Icon(Icons.camera), text: '朋友圈')
  ];
  // 初始化重载页面状态
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  //销毁页面状态
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('tab'),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: myTab,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[MyHomePage(), MyHomePage(), MyHomePage()],
        ));
  }
}

// 页面有状态的Widget
class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// 保持页面状态 必须要混入AutomaticKeepAliveClientMixin
class _HomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  bool get wantKeepAlive => true;

  void _addCreateMentCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('数字:$_count', style: Theme.of(context).textTheme.display1)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCreateMentCount,
        child: Icon(Icons.add),
        tooltip: '点击加一',
      ),
    );
  }
}
