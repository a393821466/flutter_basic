import 'package:flutter/material.dart';
import '../models/classifyModel.dart';

class ClassifyStore with ChangeNotifier {
  List classIfyListData = [];

  classIfyFunc(List list) {
    classIfyListData = list;
    notifyListeners();
  }

  get getClassifyData => classIfyListData;
}