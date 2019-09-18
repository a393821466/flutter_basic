import 'package:flutter/material.dart';

class SliverGridBox extends StatelessWidget {
  @override
  final List _list=['images/banner1.jpg','images/banner2.jpg','images/banner3.jpg','images/banner4.jpg','images/banner5.jpg','images/banner6.jpg','images/banner1.jpg','images/banner2.jpg','images/banner3.jpg','images/banner4.jpg','images/banner5.jpg','images/banner6.jpg','images/banner1.jpg','images/banner2.jpg','images/banner3.jpg','images/banner4.jpg','images/banner5.jpg','images/banner6.jpg'];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sliver'),
      ),
      body:CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
            sliver: SliverPadding(
              padding:EdgeInsets.all(6),
              sliver: SliverGrid(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 1.0
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                    return Container(
                      child:Image.asset(_list[index],fit:BoxFit.cover),
                    );
                  },
                  childCount: _list.length
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}