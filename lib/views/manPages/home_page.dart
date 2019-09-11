import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/http_service.dart';
import '../../components/home/header_widget.dart';
import '../../components/home/swiper_banner_image.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage(this.title);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List swiperData = [];
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _getbannerDataList();
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
          child: Column(
            children: <Widget>[getSwiperWidget()],
          ),
        ));
  }

  void _getbannerDataList() async {
    await HttpUtils().get('getHomeBanner').then((res) {
      List list = res['data'];
      setState(() {
        swiperData.addAll(list);
      });
    });
  }

  getSwiperWidget() {
    if (swiperData.length > 0) {
      return SwiperBannerImage(swiperBannerList: swiperData);
    } else {
      return Container(
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(220),
        child: Text('Loading...'),
      );
    }
  }
}
