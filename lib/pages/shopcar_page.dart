import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/shop_car_store.dart';

class ShopCarPage extends StatefulWidget {
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Text('阿斯达大所大所多'),
              SizedBox(height: 30),
              Text('阿斯达大所大所多'),
              SizedBox(height: 30),
              Text('阿斯达大所大所多'),
              SizedBox(height: 30),
              Text('阿斯达大所大所多'),
              SizedBox(height: 30),
              RaisedButton(
                child: Text('提交'),
                onPressed: (){
                  Provider.of<ShopCarStore>(context).changeShopCarStatus(true);
                },
              )
            ],
          ),
        )
      );
  }
}
