import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ShopCarStore with ChangeNotifier {
  // 购物车页面显示隐藏状态
  bool visible = false;
  // 购物车数据变量
  String cartString = "[]";
  // 购物车页面显示隐藏状态改变
  changeShopCarStatus(bool flat) {
    visible = flat;
    notifyListeners();
  }

  //购物车数据持久化
  saveCarData(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isBools = false;
    int iv = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        tempList[iv]['count'] = item['count'] + 1;
        isBools = true;
      }
      iv++;
    });
    if (!isBools) {
      tempList.add({
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images
      });
    }
    cartString = jsonEncode(tempList.toString());
    print(cartString);
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    print('清空完成~~~~~~~~~~~~~~~~~~~~');
    notifyListeners();
  }

  //返回购物车页面显示隐藏状态
  get getShopCarStatus => visible;
}
