import 'package:flutter/material.dart';
import '../models/categoryModel.dart';

class ClassifyStore with ChangeNotifier {
  // 左边导航数据
  List classIfyListData = [];
  // 子类导航索引
  int childIndex = 0;
  // 列表内容
  List<CategoryModel> categoryData = [];
  // 存储左边导航Id
  String leftNavigatorId = '1';

  // 获取子类导航
  classIfyFunc(List list, String id) {
    childIndex = 0;
    var das = {
      'mallSubId': 'eb68FC6D-689C-f4ce-7BbE-A82bb8dFF423',
      'mallCategoryId': list[0]['mallCategoryId'],
      'mallSubName': '全部',
      'comments': '的健康上网那你忙什么'
    };
    if (list[0]['mallSubName'] == '全部') {
      list.removeAt(0);
      list.insert(0, das);
    } else {
      list.insert(0, das);
    }
    leftNavigatorId = id;
    classIfyListData = list;
    notifyListeners();
  }

  // 改变子类导航索引
  changeCurrentIndex(int index) {
    childIndex = index;
    notifyListeners();
  }

  // 获取导航列表内容
  getGoodsList(List<CategoryModel> list) {
    categoryData = list;
    notifyListeners();
  }

  // 子导航数据
  get getClassifyData => classIfyListData;
  // 子导航索引值
  get getCurrentIndex => childIndex;
  // 导航列表内容
  get getCategoryData => categoryData;
  // 左边导航id
  get getLeftNavigatorId => leftNavigatorId;
}
