import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatefulWidget {
  static String tag = 'details_page';
  final String goodsId;
  final String images;
  final String description;
  DetailsPage({this.goodsId, this.images, this.description});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品详情')),
      body: Container(
          child: Column(
        children: <Widget>[
          _shopImage(),
          _titleIdPrice(),
        ],
      )),
    );
  }

  // 商品图片
  Widget _shopImage() {
    return Container(
      height: ScreenUtil().setHeight(600),
      alignment: Alignment.center,
      child: Hero(
        tag: 'hero${widget.goodsId}',
        child: Image.network(widget.images, fit: BoxFit.fill),
      ),
    );
  }

  // 商品标题，编号，价格
  Widget _titleIdPrice() {
    return Container(
      child: Column(
        children: <Widget>[
          Text('商品标题', style: ThemeData().textTheme.title),
          Text(
            '商品编号',
            style: TextStyle(fontSize: 24.0, color: Colors.grey[400]),
          )
        ],
      ),
    );
  }
}
