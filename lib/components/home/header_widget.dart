import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 扫一扫
class SqrCcan extends StatefulWidget {
  @override
  _SqrCcanState createState() => _SqrCcanState();
}

class _SqrCcanState extends State<SqrCcan> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print('功能尚未完善');
        },
        child: Container(
          margin: EdgeInsets.only(left: ScreenUtil().setSp(15)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 8),
              Icon(Icons.filter_center_focus, size: ScreenUtil().setSp(48)),
              Text('扫一扫', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
            ],
          ),
        ));
  }
}

// 首页头部搜索
class TopSearch extends StatefulWidget {
  @override
  _TopSearchState createState() => _TopSearchState();
}

class _TopSearchState extends State<TopSearch> {
  _wrap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  //搜索图标
  final searchIcon = Container(
    width: ScreenUtil().setWidth(40),
    height: ScreenUtil().setHeight(40),
    child: Icon(Icons.search, color: Colors.grey[400]),
  );

  // 搜索栏
  Widget _seatchContainer() {
    return Expanded(
      flex: 1,
      child: _wrap(
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('搜你喜欢的',
                style: TextStyle(
                    color: Colors.black26, fontSize: ScreenUtil().setSp(28))),
          ), () {
        print('点击跳转');
      }),
    );
  }

  // 点击录音
  final micIcon = Container(
    width: ScreenUtil().setWidth(40),
    height: ScreenUtil().setHeight(40),
    child: IconButton(
      icon: Icon(Icons.mic),
      iconSize: ScreenUtil().setSp(40),
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      color: Colors.grey[400],
      onPressed: () {
        print('还未完成');
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(66),
      padding: EdgeInsets.fromLTRB(ScreenUtil().setSp(20),
          ScreenUtil().setSp(5), ScreenUtil().setSp(25), 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: <Widget>[
          searchIcon,
          _seatchContainer(),
          micIcon,
        ],
      ),
    );
  }
}
