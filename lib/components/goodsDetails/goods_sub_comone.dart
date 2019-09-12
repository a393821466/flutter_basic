import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../store/goods_details_store.dart';

class GoodsSubComOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var gd = Provider.of<GoodsDetailsStore>(context).getDetailsData;
    return Container(
        child: Column(
      children: <Widget>[
        Html(
          data: gd == null || Provider.of<GoodsDetailsStore>(context).boolflat
              ? '<div style="width:100px;height:40px;background:#ccc"></div>'
              : gd.goodsDetail,
        ),
        SizedBox(height: ScreenUtil().setHeight(100.0)),
      ],
    ));
  }
}
