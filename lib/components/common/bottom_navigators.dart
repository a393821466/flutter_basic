import 'package:flutter/material.dart';
import '../../pages/home_page.dart';
import '../../pages/classifs_page.dart';
import '../../pages/shopcar_page.dart';
import '../../pages/my_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int ICON_FONTSIZE=48;
// 自定义数据
class NavigatorPost {
  final String title;
  final IconData icon;
  final int size;
  NavigatorPost({this.title, this.icon,this.size});
}

List<NavigatorPost> _post = [
  NavigatorPost(title: '首页', icon: Icons.home,size:ICON_FONTSIZE),
  NavigatorPost(title: '分类', icon: Icons.list,size:ICON_FONTSIZE),
  NavigatorPost(title: '购物车', icon: Icons.shopping_cart,size:ICON_FONTSIZE),
  NavigatorPost(title: '我的', icon: Icons.account_circle,size:ICON_FONTSIZE)
];

// 公共导航
class BottomNavigators extends StatefulWidget {
  @override
  _BottomNavigatorsState createState() => _BottomNavigatorsState();
}

class _BottomNavigatorsState extends State<BottomNavigators> {
  int currentIndex = 0;
  //导航页面
  List<Widget> pages = <Widget>[
    HomePage('首页'),
    ClassifsPage('分类'),
    ShopCarPage('购物车'),
    MyPage('我的')
  ];

  // 分类导航
  List<BottomNavigationBarItem> _listPageView() {
    var das = _post.map((item) {
      return BottomNavigationBarItem(
          icon: Icon(item.icon,size:ScreenUtil().setSp(item.size),),
          activeIcon: Icon(item.icon,size:ScreenUtil().setSp(item.size)),
          title: Text(item.title));
    }).toList();
    return das;
  }

  // 导航点击事件
  _handleTapNavigator(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: _listPageView(),
        onTap: _handleTapNavigator,
      ),
    );
  }
}
