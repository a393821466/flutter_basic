import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/goodsDetailsModel.dart';

// 商品标题，编号，价格
class GoodsPrice extends StatelessWidget {
  final GoodInfoModel item;
  bool flat;
  GoodsPrice(this.item, this.flat);
  @override
  Widget build(BuildContext context) {
    if (item == null || flat) {
      return Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Align(
                alignment: FractionalOffset(0, 0),
                child: Container(
                    height: ScreenUtil().setHeight(38.0),
                    width: ScreenUtil().setWidth(320.0),
                    color: Colors.grey[300]),
              ),
              SizedBox(height: ScreenUtil().setHeight(20.0)),
              Align(
                alignment: FractionalOffset(0, 0),
                child: Container(
                    height: ScreenUtil().setHeight(30.0),
                    width: ScreenUtil().setWidth(260.0),
                    color: Colors.grey[200]),
              ),
              SizedBox(height: ScreenUtil().setHeight(20.0)),
              Align(
                alignment: FractionalOffset(0, 0),
                child: Container(
                    height: ScreenUtil().setHeight(36.0),
                    width: ScreenUtil().setWidth(300.0),
                    color: Colors.grey[300]),
              ),
              SizedBox(height: ScreenUtil().setHeight(25.0)),
            ],
          ));
    } else {
      return Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '${item.goodsName}',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(36.0),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '编号：${item.goodsSerialNumber}',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(26.0),
                    color: Colors.grey[400]),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            Container(
              child: Row(
                children: <Widget>[
                  Text('¥${item.presentPrice}',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(42.0),
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: 25.0,
                  ),
                  Text(
                    '市场价：',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(32.0),
                        color: Colors.grey[500]),
                  ),
                  Text(
                    '¥${item.oriPrice}',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(28.0),
                        color: Colors.grey[300],
                        decoration: TextDecoration.lineThrough),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(25.0)),
          ],
        ),
      );
    }
  }
}
