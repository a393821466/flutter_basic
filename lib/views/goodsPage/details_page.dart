import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
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
            Text(goodsId),
            Text(images),
            Text(description)
          ],
        ),
      ),
    );
  }
}
