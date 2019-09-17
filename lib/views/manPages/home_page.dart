import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../config/http_service.dart';
import '../../store/home_store.dart';
import '../../models/annountModel.dart';
import '../../models/hotGoodsModel.dart';
import '../../models/homeGategoryModel.dart';
import '../../components/home/header_widget.dart';
import '../../components/home/swiper_banner_image.dart';
import '../../components/home/navigator_gategory.dart';
import '../../components/home/annount.dart';
import '../../components/home/hot_goods.dart';

enum LoadType { normal, add, refresh }

class HomePage extends StatefulWidget {
  final String title;
  HomePage(this.title);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;
  // 底部回弹
  bool _bottomBouncing = true;
  // 开启加载
  bool _enableLoad = true;
  // 开启无限加载
  bool _enableInfiniteLoad = true;
  // 开启控制结束刷新
  bool _enableControlFinishRefresh = true;
  // 页码
  int page = 1;
  // 每页几条
  int pageSize = 10;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _controller = EasyRefreshController();
    _getbannerDataList();
    _getAnnount();
    _getHotGoods(LoadType.normal);
    super.initState();
  }

  // 登录按钮
  final login = InkWell(
    onTap: () {
      print('功能尚未完善');
    },
    child: Container(
      margin: EdgeInsets.only(
          right: ScreenUtil().setSp(25), left: ScreenUtil().setSp(25)),
      child: Column(
        children: <Widget>[
          SizedBox(height: 8),
          Icon(Icons.input, size: ScreenUtil().setSp(48)),
          Text('登陆', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopSearch(),
        leading: SqrCcan(),
        actions: <Widget>[login],
      ),
      body: Container(
        color: Colors.grey[200],
        child: EasyRefresh(
          enableControlFinishRefresh: _enableControlFinishRefresh,
          enableControlFinishLoad: true,
          bottomBouncing: _bottomBouncing,
          controller: _controller,
          header: ClassicalHeader(
              refreshText: '下拉刷新',
              refreshReadyText: '松开刷新',
              refreshingText: '正在刷新',
              refreshedText: '完成刷新',
              noMoreText: '',
              showInfo: false),
          footer: ClassicalFooter(
              enableInfiniteLoad: _enableInfiniteLoad,
              loadedText: '加载完成',
              loadText: '松开回弹..',
              loadReadyText: '松开加载更多..',
              loadingText: '加载中..',
              noMoreText: Provider.of<HomeStore>(context).getHomeNoMore,
              showInfo: false),
          child: ListView(
            children: <Widget>[
              SwiperBannerImage(),
              NavigatorGategory(),
              AnountList(),
              HotGoodsList()
            ],
          ),
          // 加载
          onLoad: () async {
            var total = Provider.of<HomeStore>(context).total;
            if (page <= total) {
              await _getHotGoods(LoadType.add);
            }
            Provider.of<HomeStore>(context).changeNoMore('暂无内容..');
            _controller.finishLoad(noMore: page == total);
          },
          // 刷新
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              print('111');
              _controller.resetLoadState();
            });
            _controller.finishRefresh(success: true);
          },
        ),
      ),
    );
  }

// 首页数据请求
  void _getbannerDataList() async {
    await HttpUtils().get('homePage').then((res) {
      var das = res['data'];
      HomeDataModel list = HomeDataModel.fromJson(das);
      Provider.of<HomeStore>(context).homeDataList(list);
    });
  }

// 首页公告请求
  void _getAnnount() async {
    await HttpUtils().get('annount').then((res) {
      AnnountModel data = AnnountModel.fromJson(res);
      Provider.of<HomeStore>(context).annountList(data);
    });
  }

// 火爆商品
  void _getHotGoods(loadTypes) async {
    var formPage = {'page': page, 'pageSize': pageSize};
    await HttpUtils().get('hotGoodsList', data: formPage).then((res) {
      var das = res['data'];
      HotGoodsDataModel data = HotGoodsDataModel.fromJson(das);
      if (loadTypes == LoadType.normal) {
        page = 1;
        Provider.of<HomeStore>(context).hotGoodsList(data);
      } else if (loadTypes == LoadType.add) {
        page++;
        Provider.of<HomeStore>(context).addHotGoodsList(data);
      }
    });
  }
}
