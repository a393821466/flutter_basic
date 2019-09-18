import 'package:flutter/material.dart';

class CounterStore with ChangeNotifier{
  int sum=0;

  add(){
    sum++;
    notifyListeners();
  }

  get countQuery => sum;
}