import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
//轮播组件
class BannerSwiper extends StatelessWidget {

  List _imageUrls=['images/banner1.jpg','images/banner2.jpg','images/banner3.jpg','images/banner4.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图'),
      ),
      body:Container(
        height:180.0,
        child: Swiper(
          itemCount: _imageUrls.length,
          itemBuilder: (BuildContext context,int index){
            return Image.asset(
              _imageUrls[index],
              fit:BoxFit.cover
            );
          },
          autoplay:true,
          pagination:SwiperPagination() ,
        ),
      )
    );
  }
}