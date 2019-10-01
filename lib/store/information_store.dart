import 'package:flutter/material.dart';
import '../models/informationModel.dart';

class InformationStore extends ChangeNotifier {
  List tabsList = [];
  //- GET TAB NAVIGATOR
  getInformationList(InfomationDataModel list) {
    // tabs = list.content;
    var tabListData = list.content;
    Map arr = {};
    List arrData = [];
    for (var i = 0; i < tabListData.length; i++) {
      if (arr.containsKey(tabListData[i].navText)) {
        arr[tabListData[i].navText].add(tabListData[i]);
      } else {
        var arrs = [];
        arrs.add(tabListData[i]);
        arr[tabListData[i].navText] = arrs;
        // tabs.add(tabListData[i].navText);
        var data = {"navTitle": tabListData[i].navText, "navList": arrs};
        arrData.add(data);
      }
    }
    tabsList = arrData;
    notifyListeners();
  }

  get getTabsList => tabsList;
}
