import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'navigatorShopCar/route_animate_lib.dart';
import '../../store/shop_car_store.dart';
import '../../store/currentIndex.dart';
import '../../views/manPages/home_page.dart';
import '../../views/goodsPage/classifs_page.dart';
import '../../views/shopCarPage/shopcar_page.dart';
import '../../views/informationPage/information_page.dart';
import '../../views/myPage/my_page.dart';



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


class NavigatorListPage extends StatelessWidget {
  
  // 页面
  List<Widget> pages = <Widget>[
    HomePage('首页'),
    ClassifsPage('分类'),
    ShopCarPage(),
    InformationPage('资讯'),
    MyPage('我的')
  ];

  // 分类导航
  List<BottomNavigationBarItem> _listPageView(context) {
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
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Consumer<CurrentIndexStore>(
      builder: (context,val,_){
        int currentIndex=Provider.of<CurrentIndexStore>(context).getCurIdx;
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _listPageView(context),
            currentIndex: currentIndex,
            onTap: (int index){
              if (index == 2) {
                _shopCarClick(context);
                return;
              }
              Provider.of<CurrentIndexStore>(context).changeIndex(index);
            },
          ),
          floatingActionButton: _floatingActionButtonCenter(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: IndexedStack(
            index: currentIndex,
            children: pages,
          ),
        );
      },
    );
  }
    // 购物车导航点击事件
  _shopCarClick(context) {
    Navigator.of(context).push(TransparentRoute(
      builder: (context) => RippleBackdropAnimatePage(
        child: Provider.of<ShopCarStore>(context).getShopCarStatus
            ? ShopCarPage()
            : Text(''),
        childFade: true,
        duration: 300,
        blurRadius: 0.0,
        colors: Colors.grey[500],
        bottomButton: Icon(Icons.close),
        bottomHeight: ScreenUtil().setHeight(120),
        bottomButtonRotate: false,
      ),
    ));
    Provider.of<ShopCarStore>(context).changeShopCarStatus(true);
  }
    // 购物车导航按钮
  Widget _floatingActionButtonCenter(context) {
    return InkWell(
      onTap: () {
        _shopCarClick(context);
      },
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
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