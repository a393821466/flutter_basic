import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperBannerImage extends StatelessWidget{
  final List swiperBannerList;
  SwiperBannerImage({Key key, this.swiperBannerList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height:ScreenUtil().setHeight(220),
          width: ScreenUtil().setWidth(750),
          child:Swiper(
            itemCount: swiperBannerList.length,
            itemBuilder: (BuildContext context,int index){
              return Image.network(swiperBannerList[index]['imgUrl'],fit:BoxFit.fill);
            },
            pagination: SwiperPagination(),
            autoplay: true,
          ),
        ),
        Positioned(
          bottom: -1,
          child: ClipOval(
            clipper: OvalTopBorderClipper(),
            child: Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(12),
              color: Colors.grey[200],
            ),
          ),
        )
      ],
    );
  }
}


// 弧度
class OvalTopBorderClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height * 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}