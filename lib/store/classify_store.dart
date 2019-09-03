import 'package:flutter/material.dart';
// import '../models/classifyModel.dart';

class ClassifyStore with ChangeNotifier {
  List classIfyListData = [];

  classIfyFunc(List list) {
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
    classIfyListData = list;
    notifyListeners();
  }

  get getClassifyData => classIfyListData;
}
