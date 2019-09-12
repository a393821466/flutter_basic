import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/goodsDetailsModel.dart';

// 详情图片
class GoodsDetailImg extends StatelessWidget {
  final String goodsId;
  final String images;
  final GoodInfoModel item;
  bool flat;
  GoodsDetailImg(this.goodsId, this.images, this.item, this.flat);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(500),
      color: Colors.white,
      alignment: Alignment.center,
      child: Hero(
        tag: 'hero${goodsId}',
        child: item == null || flat
            ? Image.network(images, fit: BoxFit.fill)
            : Image.network(item.image1, fit: BoxFit.fill),
      ),
    );
  }
}
