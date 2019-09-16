import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../common/navigatorShopCar/route_animate_lib.dart';
import '../../store/shop_car_store.dart';
import '../../config/dialog_utils.dart';
import '../../views/shopCarPage/shopcar_page.dart';

class GoodsBuyCar extends StatefulWidget {
  final getDetails;
  GoodsBuyCar(this.getDetails);
  @override
  _GoodsBuyCarState createState() => _GoodsBuyCarState();
}

class _GoodsBuyCarState extends State<GoodsBuyCar> {
  bool flat = true;
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
            Stack(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(TransparentRoute(
                      builder: (context) => RippleBackdropAnimatePage(
                        child: Provider.of<ShopCarStore>(context).getShopCarStatus
                            ? ShopCarPage()
                            : Text(''),
                        childFade: true,
                        duration: 300,
                        blurRadius: 0.0,
                        colors: Colors.grey[500],
                        bottomButton: Icon(Icons.close),
                        bottomHeight: ScreenUtil().setHeight(120),
                        bottomButtonRotate: false,
                      ),
                    ));
                    Provider.of<ShopCarStore>(context).changeShopCarStatus(true);
                  },
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
                Consumer<ShopCarStore>(
                  builder: (context,val,_){
                    int goodsCount=Provider.of<ShopCarStore>(context).allGoodsNum;
                    return goodsCount==0?Text(''):Positioned(
                      right:8,
                      top:5,
                      child: Container(
                        padding:EdgeInsets.fromLTRB(6, 3, 6, 3),
                        decoration: BoxDecoration(
                          color:Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width:1,color:Colors.white),
                        ),
                        child: Text('${goodsCount}',style:TextStyle(fontSize: ScreenUtil().setSp(22),color:Colors.white)),
                      ),
                    );
                  },
                )
              ],
            ),
            InkWell(
              onTap: () async {
                if (flat) {
                  await Provider.of<ShopCarStore>(context)
                      .saveCarData(goodsId, goodsName, count, price, images);
                }
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
