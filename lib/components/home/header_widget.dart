import 'package:flutter/material.dart';
import './search_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './search_widget.dart';

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
  final TextEditingController _controller = TextEditingController();

  _onChanged(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(64),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(60),
            alignment: Alignment.center,
            child: Icon(Icons.search,
                size: ScreenUtil().setSp(48), color: Colors.grey[400]),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              onTap: () {
                showSearch(context: context, delegate: sreachPages());
              },
              controller: _controller,
              onChanged: _onChanged,
              autofocus: false,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  border: InputBorder.none,
                  hintText: '搜你喜欢的...',
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(26))),
            ),
          ),
          IconButton(
            icon: Icon(Icons.local_see),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: ScreenUtil().setSp(10)),
            iconSize: ScreenUtil().setSp(42),
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
    InkWell(
        onTap: () {
          print('功能尚未完善');
        },
        child: Container(
          margin: EdgeInsets.only(
              right: ScreenUtil().setSp(20), left: ScreenUtil().setSp(20)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 8),
              Icon(Icons.map, size: ScreenUtil().setSp(48)),
              Text('地区', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
            ],
          ),
        )),
    InkWell(
      onTap: () {
        print('功能尚未完善');
      },
      child: Container(
        margin: EdgeInsets.only(
            right: ScreenUtil().setSp(20), left: ScreenUtil().setSp(20)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            Icon(Icons.cast_connected, size: ScreenUtil().setSp(48)),
            Text('会员码', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
          ],
        ),
      ),
    ),
  ];
  return _list;
}
