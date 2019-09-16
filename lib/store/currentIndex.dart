import 'package:flutter/material.dart';

class CurrentIndexStore with ChangeNotifier{
  int currentIndex=0;

  changeIndex(int idx){
    currentIndex=idx;
    notifyListeners();
  }

  get getCurIdx => currentIndex;
}