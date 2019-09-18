import 'package:flutter/material.dart';
import 'package:flutter_t1/pages/basic_page.dart';
import 'package:flutter_t1/pages/advanced_page.dart';
import 'package:flutter_t1/pages/form_page.dart';
import 'package:flutter_t1/pages/media_page.dart';
import 'package:flutter_t1/pages/outher_page.dart';
import 'package:flutter_t1/utils/bar_json.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigatorBarTab extends StatefulWidget {
  _NavigatorBarTabState createState() => _NavigatorBarTabState();
}

class _NavigatorBarTabState extends State<NavigatorBarTab> {
  var currentIndex = 0;
  final List<Widget> _page = <Widget>[
    BasicPage(title: '基础'),
    AdvancedPage(title: '高级'),
    FormPages(title: '状态'),
    MediaPage(title: '媒体'),
    OutherPage(title: '其它')
  ];

  _hanlderClick(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  tabViewList() {
    final List<BottomNavigationBarItem> _tabView = <BottomNavigationBarItem>[];
    for (var i = 0; i < menuList.length; i++) {
      _tabView.add(BottomNavigationBarItem(
        icon: Icon(menuList[i].icon, size: menuList[i].fontSized),
        activeIcon: Icon(menuList[i].icon, size: menuList[i].fontSized),
        title: Text(menuList[i].title),
      ));
    }
    return _tabView;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      child: Scaffold(
        body: _page[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _hanlderClick,
          items: tabViewList(),
        ),
      ),
    );
  }
}
