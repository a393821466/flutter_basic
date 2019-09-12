import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'goods_sub_comone.dart';

// 评论与详情
class GoodsComments extends StatefulWidget {
  @override
  _GoodsCommentsState createState() => _GoodsCommentsState();
}

class _GoodsCommentsState extends State<GoodsComments> {
  bool tabFlat = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    tabFlat = true;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(100.0),
                  width: ScreenUtil().setWidth(335.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: ScreenUtil().setSp(2),
                        color: tabFlat
                            ? Theme.of(context).primaryColor
                            : Color.fromRGBO(255, 255, 255, 0),
                      ),
                    ),
                  ),
                  child: Text(
                    '商品详情',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        color: tabFlat
                            ? Theme.of(context).primaryColor
                            : Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    tabFlat = false;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(100.0),
                  width: ScreenUtil().setWidth(335.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: ScreenUtil().setSp(2),
                        color: tabFlat
                            ? Color.fromRGBO(255, 255, 255, 0)
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  child: Text(
                    '商品评论',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        color: tabFlat
                            ? Colors.grey
                            : Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[tabFlat ? GoodsSubComOne() : Text('sadasdasd')],
          ),
        )
      ],
    );
  }
}
