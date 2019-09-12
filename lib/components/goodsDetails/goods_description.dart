import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsDescrition extends StatelessWidget {
  bool flat;
  GoodsDescrition(this.flat);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: ScreenUtil().setHeight(15.0)),
        Container(
          height: ScreenUtil().setHeight(60.0),
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            '说明：绿色安全 > 急速送达 > 好吃不腻',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: ScreenUtil().setSp(26)),
          )
        ),
        SizedBox(height: ScreenUtil().setHeight(15.0))
      ],
    );
  }
}
