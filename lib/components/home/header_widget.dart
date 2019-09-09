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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(70),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(58),
            alignment: Alignment.center,
            child: Icon(Icons.search,
                size: ScreenUtil().setSp(45), color: Colors.grey[400]),
          ),
          Expanded(
              flex: 1,
              child: _wrap(
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('搜你喜欢的',
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: ScreenUtil().setSp(26))),
                  ), () {
                print(1111);
              })),
          IconButton(
            icon: Icon(Icons.mic),
            alignment: Alignment.topCenter,
            iconSize: ScreenUtil().setSp(44),
            color: Colors.grey[400],
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

// 右边按钮（地区，会员码）
List<Widget> rightIconButton() {
  List<Widget> _list = <Widget>[
    // InkWell(
    //     onTap: () {
    //       print('功能尚未完善');
    //     },
    //     child: Container(
    //       margin: EdgeInsets.only(
    //           right: ScreenUtil().setSp(20), left: ScreenUtil().setSp(20)),
    //       child: Column(
    //         children: <Widget>[
    //           SizedBox(height: 8),
    //           Icon(Icons.map, size: ScreenUtil().setSp(48)),
    //           Text('地区', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
    //         ],
    //       ),
    //     )),
    InkWell(
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
    ),
  ];
  return _list;
}
