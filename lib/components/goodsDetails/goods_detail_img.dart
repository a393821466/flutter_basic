import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/goodsDetailsModel.dart';

// 详情图片
class GoodsDetailImg extends StatelessWidget {
  final String goodsId;
  final GoodInfoModel item;
  GoodsDetailImg(this.goodsId,  this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(500),
      color: Colors.white,
      alignment: Alignment.center,
      child: Image.network(item.image1, fit: BoxFit.fill)
      // Hero(
      //   tag: 'hero${goodsId}',
      //   child: Image.network(item.image1, fit: BoxFit.fill)
      // ),
    );
  }
}
