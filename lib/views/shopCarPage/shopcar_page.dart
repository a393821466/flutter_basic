import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../store/shop_car_store.dart';
import '../../components/shoppingCar/cart_item.dart';
import '../../components/shoppingCar/cart_bottom.dart';

class ShopCarPage extends StatefulWidget {
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  List carList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Scaffold(
        appBar: AppBar(
          title: Text('购物车', style: TextStyle(color: Colors.black54)),
          leading: Text(''),
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.white,
          child: _mapItemList(),
        ),
      ),
    );
  }

  Widget _mapItemList() {
    return FutureBuilder(
      future: _getShoppingCarInfo(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List cartList = Provider.of<ShopCarStore>(context).getShoppingCarData;
          return Stack(
            children: <Widget>[
              Consumer<ShopCarStore>(
                builder: (context, catgory, _) {
                  cartList =
                      Provider.of<ShopCarStore>(context).getShoppingCarData;
                  if (cartList.length != 0) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          return CartItem(cartList[index]);
                        },
                      ),
                    );
                  } else {
                    return ListView(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(top: ScreenUtil().setSp(160)),
                              child: Icon(Icons.sentiment_dissatisfied,
                                  color: Colors.grey[300], size: 64),
                            ),
                            Text(
                              '购物车空空如也',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(40),
                                  color: Colors.grey[300]),
                            )
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: CartBottom(),
              )
            ],
          );
        } else {
          return Text('加载中...');
        }
      },
    );
  }

  Future<String> _getShoppingCarInfo(BuildContext context) async {
    await Provider.of<ShopCarStore>(context).getCarInfo();
    return 'end';
  }
}
