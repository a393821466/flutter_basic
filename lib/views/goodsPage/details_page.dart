import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatelessWidget {
  static String tag='details_page';
  final String goodsId;
  final String images;
  final String description;
  DetailsPage({this.goodsId,this.images,this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品详情')),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height:ScreenUtil().setHeight(330),
              alignment:Alignment.center,
              child: Hero(
                tag:'hero${goodsId}',
                child:Image.network(images,fit:BoxFit.fill),
              ),
            ),
            // Image.network(images,fit:BoxFit.fill),
            Text(description)
          ],
        )
      ),
    );
  }
}
