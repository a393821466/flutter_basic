import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String goodId;

  DetailsPage(this.goodId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品详情')),
      body: Container(
        child: Text('商品id:${goodId}'),
      ),
    );
  }
}
