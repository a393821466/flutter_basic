import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../store/shop_car_store.dart';
import '../../pages/home_page.dart';
import '../../pages/classifs_page.dart';
import '../../pages/shopcar_page.dart';
import '../../pages/information_page.dart';
import '../../pages/my_page.dart';

int ICON_FONTSIZE = 48;

// 自定义数据
class NavigatorPost {
  final String title;
  final IconData icon;
  final int size;
  final Color iColor;
  NavigatorPost({this.title, this.icon, this.size, this.iColor});
}

List<NavigatorPost> _post = [
  NavigatorPost(
      title: '首页',
      icon: Icons.home,
      size: ICON_FONTSIZE,
      iColor: Colors.black54),
  NavigatorPost(
      title: '分类',
      icon: Icons.list,
      size: ICON_FONTSIZE,
      iColor: Colors.black54),
  NavigatorPost(
      title: '购物车',
      icon: Icons.shopping_cart,
      size: ICON_FONTSIZE,
      iColor: Color.fromRGBO(255, 255, 255, 0)),
  NavigatorPost(
      title: '资讯',
      icon: Icons.assignment,
      size: ICON_FONTSIZE,
      iColor: Colors.black54),
  NavigatorPost(
      title: '我的',
      icon: Icons.account_circle,
      size: ICON_FONTSIZE,
      iColor: Colors.black54)
];

class NavigatorListPage extends StatefulWidget {
  @override
  _NavigatorListPageState createState() => _NavigatorListPageState();
}

class _NavigatorListPageState extends State<NavigatorListPage>
    with TickerProviderStateMixin {
  int currentIndex = 0;

  Animation<RelativeRect> animationTest;
  AnimationController controllerTest;

  @override
  void initState() {
    // 动画定义
    controllerTest = new AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    animationTest = RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 300, 0, 0),
            end: RelativeRect.fromLTRB(0, 0, 0, 0))
        .animate(controllerTest);
    animationTest.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          Provider.of<ShopCarStore>(context).getShopCarStatus == true) {
        controllerTest.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // 销毁动画
    controllerTest.dispose();
  }

  List<Widget> pages = <Widget>[
    HomePage('首页'),
    ClassifsPage('分类'),
    ShopCarPage('购物车'),
    InformationPage('资讯'),
    MyPage('我的')
  ];

  // 分类导航
  List<BottomNavigationBarItem> _listPageView() {
    var das = _post.map((item) {
      return BottomNavigationBarItem(
          icon: Icon(item.icon,
              size: ScreenUtil().setSp(item.size), color: item.iColor),
          activeIcon: Icon(item.icon,
              size: ScreenUtil().setSp(item.size),
              color: Theme.of(context).primaryColor),
          title: Text(item.title));
    }).toList();
    return das;
  }

  // 导航点击事件
  _handleTapNavigator(int index) {
    if (index == 2) {
      _shopCarClick();
      return;
    }
    setState(() {
      currentIndex = index;
    });
  }

  // 购物车导航点击事件
  _shopCarClick() {
    Provider.of<ShopCarStore>(context).changeShopCarStatus(false);
    controllerTest.forward();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Stack(
      children: <Widget>[
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _listPageView(),
            currentIndex: currentIndex,
            onTap: _handleTapNavigator,
          ),
          floatingActionButton: _floatingActionButtonCenter(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: IndexedStack(
            index: currentIndex,
            children: pages,
          ),
        ),
        PositionedTransition(
            rect: animationTest,
            child: AnimatedOpacity(
              opacity: Provider.of<ShopCarStore>(context).getShopCarStatus
                  ? 0.0
                  : 1.0,
              duration: Duration(milliseconds: 200),
              child: Offstage(
                offstage: Provider.of<ShopCarStore>(context).getShopCarStatus,
                child: Container(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(1294),
                  child: ShopCarPage('购物车'),
                ),
              ),
            ))
      ],
    );
  }

  // 购物车导航按钮
  Widget _floatingActionButtonCenter() {
    return InkWell(
      onTap: () {
        _shopCarClick();
      },
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setSp(12)),
        margin: EdgeInsets.only(top: 5),
        width: ScreenUtil().setSp(120),
        height: ScreenUtil().setSp(120),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().setSp(200)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                offset: Offset(0.0, -5.0),
                blurRadius: 10,
                spreadRadius: -7.0)
          ],
          color: Colors.white,
        ),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            _post[2].icon,
            color: Colors.white,
            size: ScreenUtil().setSp(50),
          ),
          onPressed: null,
        ),
      ),
    );
  }
}
