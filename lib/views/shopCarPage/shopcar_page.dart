import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          title:Text('购物车',style: TextStyle(color:Colors.black54)),
          leading: Text(''),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          child:_mapItemList()
        ),
      )
    );
  }

  Widget _mapItemList(){
    return FutureBuilder(
      future:_getShoppingCarInfo(context),
      builder: (context,snapshot){
        if(snapshot.hasData){
          List cartList=Provider.of<ShopCarStore>(context).getShoppingCarData;
          return Stack(
            children: <Widget>[
              ListView.builder(
                itemCount:cartList.length,
                itemBuilder: (context,index){
                  return CartItem(cartList[index]);
                },
              ),
              Positioned(
                bottom:0,
                left:0,
                child: CartBottom(),
              )
            ],
          );
        }else{
          return Text('暂无内容...');
        }
      },
    );
  }

  Future<String> _getShoppingCarInfo(BuildContext context) async{
    await Provider.of<ShopCarStore>(context).getCarInfo();
    return 'end';
  }
}
