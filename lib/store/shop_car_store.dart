import 'package:flutter/material.dart';

class ShopCarStore with ChangeNotifier {
  // 购物车显示隐藏状态
  bool visible = false;

  // 购物车显示隐藏状态改变
  changeShopCarStatus(bool flat) {
    visible = flat;
    notifyListeners();
  }

  //返回状态
  get getShopCarStatus => visible;
}
