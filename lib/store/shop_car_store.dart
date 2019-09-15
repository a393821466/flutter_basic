import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/shoppingCarModel.dart';

class ShopCarStore with ChangeNotifier {
  // 购物车页面显示隐藏状态
  bool visible = false;
  // 购物车数据变量
  String getCartString = '[]';
  List<ShoppingCarModel> shoppingCarList=[];
  // 购物车页面显示隐藏状态改变
  changeShopCarStatus(bool flat) {
    visible = flat;
    notifyListeners();
  }

  //购物车数据持久化
  saveCarData(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartString = prefs.getString('cartInfo');
    var tempList = getCartString == null ? [] : json.decode(getCartString);
    bool isBools = false;
    int iv = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        tempList[iv]['count'] = item['count'] + 1;
        shoppingCarList[iv].count++;
        isBools = true;
      }
      iv++;
    });
    if (!isBools) {
      Map<String,dynamic> newGoods={
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck':true,
      };
      tempList.add(newGoods);
      shoppingCarList.add(ShoppingCarModel.fromJson(newGoods));
    }
    getCartString = jsonEncode(tempList);
    prefs.setString('cartInfo', getCartString);
    notifyListeners();
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    shoppingCarList=[];
    print('清空完成~~~~~~~~~~~~~~~~~~~~');
    notifyListeners();
  }

  getCarInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartString=prefs.getString('cartInfo');
    shoppingCarList=[];
    if(getCartString==null){
      shoppingCarList=[];
    }else{
      var tempList=json.decode(getCartString);
      tempList.forEach((item){
        shoppingCarList.add(ShoppingCarModel.fromJson(item));
      });
    }
    notifyListeners();
  }
  //返回购物车页面显示隐藏状态
  get getShopCarStatus => visible;
  // 返回购物车数据
  get getShoppingCarData => shoppingCarList;
}
