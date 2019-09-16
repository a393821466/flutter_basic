import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/shoppingCarModel.dart';

int BIGNUMCOUNT = 99;
int SMALLNUMCOUNT = 1;

class ShopCarStore with ChangeNotifier {
  // 购物车页面显示隐藏状态
  bool visible = false;
  // 购物车数据变量
  String getCartString = '[]';
  List<ShoppingCarModel> shoppingCarList = [];
  // 总价格
  double allPrice = 0;
  // 总数量
  int allGoodsCount = 0;
  // 全选
  bool isAllCheck = true;
  // 购物车页面显示隐藏状态改变
  changeShopCarStatus(bool flat) {
    visible = flat;
    notifyListeners();
  }

  //添加prefs
  saveCarData(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartString = prefs.getString('cartInfo');
    var tempList = getCartString == null ? [] : json.decode(getCartString);
    bool isBools = false;
    int iv = 0;
    allPrice=0;
    allGoodsCount=0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        tempList[iv]['count'] = item['count'] + 1;
        shoppingCarList[iv].count++;
        isBools = true;
      }
      if(item['isCheck']){
        // allPrice+=(cartList[iv].price*cartList[iv].count);
        allPrice = NumUtil.add(
              allPrice, NumUtil.multiply(item['count'], item['price']));
        allGoodsCount+=item['count'];
      }
      iv++;
    });
    if (!isBools) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': true,
      };
      tempList.add(newGoods);
      shoppingCarList.add(ShoppingCarModel.fromJson(newGoods));
      allPrice=NumUtil.add(
              allPrice, NumUtil.multiply(count, price));
      allGoodsCount+=count;
    }
    getCartString = jsonEncode(tempList);
    prefs.setString('cartInfo', getCartString);
    notifyListeners();
  }

  // 清空prefs
  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    shoppingCarList = [];
    allPrice=0;
    allGoodsCount=0;
    print('清空完成~~~~~~~~~~~~~~~~~~~~');
    notifyListeners();
  }

  // 查询prefs
  getCarInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartString = prefs.getString('cartInfo');
    shoppingCarList = [];
    if (getCartString == null) {
      shoppingCarList = [];
    } else {
      var tempList = json.decode(getCartString);
      allPrice = 0;
      allGoodsCount = 0;
      isAllCheck = true;
      tempList.forEach((item) {
        if (item['isCheck']) {
          // allPrice += (item['count'] * item['price']);
          allPrice = NumUtil.add(
              allPrice, NumUtil.multiply(item['count'], item['price']));
          allGoodsCount += item['count'];
        } else {
          isAllCheck = false;
        }
        shoppingCarList.add(ShoppingCarModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  // 删除prefs内唯一Key
  deleteSingleGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartString = prefs.getString('cartInfo');
    List tempList = json.decode(getCartString);
    int tempIndex = 0;
    int delIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    getCartString = json.encode(tempList);
    prefs.setString('cartInfo', getCartString);
    await getCarInfo();
  }

  // 多选按钮商品
  changeCheckState(ShoppingCarModel cartItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartString = prefs.getString('cartInfo');
    List tempList = json.decode(getCartString);
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == cartItem.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = cartItem.toJson();
    getCartString = json.encode(tempList);
    prefs.setString('cartInfo', getCartString);
    await getCarInfo();
  }

  // 全选按钮
  changeAllCheckBox(bool flat) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartString = prefs.getString('cartInfo');
    List tempList = json.decode(getCartString);
    List newList = [];
    tempList.forEach((item) {
      var newItem = item;
      newItem['isCheck'] = flat;
      newList.add(newItem);
    });
    getCartString = json.encode(newList);
    prefs.setString('cartInfo', getCartString);
    await getCarInfo();
  }

  // 增加数量
  addorReduceActive(var cartItem, String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartString = prefs.getString('cartInfo');
    List tempList = json.decode(getCartString);
    List newList = [];
    tempList.forEach((item) {
      var newItem = item;
      if (type == 'reduce' && cartItem.goodsId == item['goodsId']) {
        if (newItem['count'] == SMALLNUMCOUNT) {
          newItem['count'] = SMALLNUMCOUNT;
        } else {
          newItem['count'] = newItem['count'] - 1;
        }
      }
      if (type == 'add' && cartItem.goodsId == item['goodsId']) {
        if (newItem['count'] >= BIGNUMCOUNT) {
          newItem['count'] = BIGNUMCOUNT;
        } else {
          newItem['count'] = newItem['count'] + 1;
        }
      }
      newList.add(newItem);
    });
    getCartString = json.encode(newList);
    prefs.setString('cartInfo', getCartString);
    await getCarInfo();
  }

  //返回购物车页面显示隐藏状态
  get getShopCarStatus => visible;
  // 返回购物车数据
  get getShoppingCarData => shoppingCarList;
  // 购物车价格
  get allGoodsPrice => allPrice;
  // 购物车数量
  get allGoodsNum => allGoodsCount;
}
