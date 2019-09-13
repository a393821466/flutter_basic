import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../store/shop_car_store.dart';

class GoodsBuyCar extends StatefulWidget {
  final getDetails;
  GoodsBuyCar(this.getDetails);
  @override
  _GoodsBuyCarState createState() => _GoodsBuyCarState();
}

class _GoodsBuyCarState extends State<GoodsBuyCar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var goodsId = widget.getDetails.goodsId;
    var goodsName = widget.getDetails.goodsName;
    int count = 1;
    var price = widget.getDetails.presentPrice;
    var images = widget.getDetails.image1;
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        color: Colors.white,
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(750),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                width: ScreenUtil().setWidth(110),
                alignment: Alignment.center,
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await Provider.of<ShopCarStore>(context)
                    .saveCarData(goodsId, goodsName, count, price, images);
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(100),
                color: Colors.green,
                child: Text('加入购物车',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(28), color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () async {
                await Provider.of<ShopCarStore>(context).remove();
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(100),
                color: Theme.of(context).primaryColor,
                child: Text('立即购买',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(28), color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
