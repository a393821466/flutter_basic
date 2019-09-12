import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GoodsSkeleton extends StatelessWidget {
  final Color colors=Colors.grey[200];
  final double floatNumber=20.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.grey[100],
      child: Column(
        children: <Widget>[
          Container(height: ScreenUtil().setHeight(500),
          padding:EdgeInsets.all(floatNumber),color:Colors.white,child: Container(color:colors),),
          Container(
            padding:EdgeInsets.all(floatNumber),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset(0, 0),
                  child: Container(
                      height: ScreenUtil().setHeight(34.0),
                      width: ScreenUtil().setWidth(420.0),
                      padding:EdgeInsets.all(floatNumber),
                      color: colors),
                ),
                SizedBox(height: ScreenUtil().setHeight(20.0)),
                Align(
                  alignment: FractionalOffset(0, 0),
                  child: Container(
                      height: ScreenUtil().setHeight(30.0),
                      width: ScreenUtil().setWidth(300.0),
                      color: colors),
                ),
                SizedBox(height: ScreenUtil().setHeight(20.0)),
                Align(
                  alignment: FractionalOffset(0, 0),
                  child: Container(
                      height: ScreenUtil().setHeight(36.0),
                      width: ScreenUtil().setWidth(360.0),
                      color: colors),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(60.0),
            color: Colors.white,
            margin:EdgeInsets.only(top:floatNumber),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: floatNumber, right: floatNumber),
            child: Container(
              height: ScreenUtil().setHeight(28),
              color: colors,
              width: ScreenUtil().setWidth(500)),
          ),
          Container(
            margin:EdgeInsets.only(top:floatNumber),
            color: Colors.white,
            padding:EdgeInsets.only(left:floatNumber,right:floatNumber),
            height:ScreenUtil().setHeight(80),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Container(
                  width:ScreenUtil().setWidth(300),
                  height:ScreenUtil().setHeight(40),
                  color:colors,
                ),
                SizedBox(width:ScreenUtil().setWidth(70)),
                Container(
                  width:ScreenUtil().setWidth(300),
                  height:ScreenUtil().setHeight(40),
                  color:colors,
                )
              ],
            ),
          ),
          Container(
            width:ScreenUtil().setWidth(750),
            height:ScreenUtil().setHeight(200),
            color:Colors.white,
            padding:EdgeInsets.all(floatNumber),
            child: Container(
              color:colors,
            ),
          )
        ],
      ),
    );
  }
}