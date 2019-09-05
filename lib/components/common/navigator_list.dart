import 'package:flutter/material.dart';
import 'package:ace_bottom_navigation_bar/ace_bottom_navigation_bar.dart';
// import '../../pages/home_page.dart';
// import '../../pages/classifs_page.dart';
// import '../../pages/shopcar_page.dart';
// import '../../pages/my_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int ICON_FONTSIZE = 48;

// 自定义数据
class NavigatorPost {
  final String title;
  final IconData icon;
  final int size;
  NavigatorPost({this.title, this.icon, this.size});
}

List<NavigatorPost> _post = [
  NavigatorPost(title: '首页', icon: Icons.home, size: ICON_FONTSIZE),
  NavigatorPost(title: '分类', icon: Icons.list, size: ICON_FONTSIZE),
  NavigatorPost(title: '购物车', icon: Icons.shopping_cart, size: ICON_FONTSIZE),
  NavigatorPost(title: '我的', icon: Icons.account_circle, size: ICON_FONTSIZE)
];

class CommonNavigatorBar extends StatefulWidget {
  @override
  _CommonNavigatorBarState createState() => _CommonNavigatorBarState();
}

class _CommonNavigatorBarState extends State<CommonNavigatorBar>
    with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();

  int currentIndex = 0;
  //导航页面
  // List<Widget> pages = <Widget>[
  //   HomePage('首页'),
  //   ClassifsPage('分类'),
  //   ShopCarPage('购物车'),
  //   MyPage('我的')
  // ];
  List<Widget> pages = <Widget>[
    Homepage(),
    Homepage1(),
    Homepage2(),
    Homepage3()
  ];
  // 分类导航
  List<NavigationItemBean> _listPageView() {
    var das = _post.map((item) {
      return NavigationItemBean(
          selected: currentIndex,
          icon: Icon(
            item.icon,
            size: ScreenUtil().setSp(item.size),
          ),
          iconUnSelectedColor: Icon(
            item.icon,
            size: ScreenUtil().setSp(item.size),
          ),
          iconSelectedColor: Icon(
            item.icon,
            size: ScreenUtil().setSp(item.size),
          ),
          textStr: Text('s'),
          textSelectedColor: Text('s'),
          textUnSelectedColor: Text('s'));
    }).toList();
    return das;
  }

  @override
  void initState() {
    super.initState();
  }

  _hanldeNavigator(int index) {
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
      bottomNavigationBar: Container(
        child: ACEBottomNavigationBar(
          type: ACEBottomNavigationBarType.zoomout,
          items: _listPageView(),
          initSelectedIndex: currentIndex,
          onTabChangedListener: _hanldeNavigator,
        ),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('111')),
        body: Center(
          child: Text('111'),
        ));
  }
}

class Homepage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('222')),
        body: Center(
          child: Text('222'),
        ));
  }
}

class Homepage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('333')),
        body: Center(
          child: Text('333'),
        ));
  }
}

class Homepage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('444')),
        body: Center(
          child: Text('444'),
        ));
  }
}
