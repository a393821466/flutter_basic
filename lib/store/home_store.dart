import 'package:flutter/material.dart';
import '../models/hotGoodsModel.dart';
import '../models/homeGategoryModel.dart';
import '../models/annountModel.dart';

class HomeStore with ChangeNotifier {
  List<BannerModel> homeBanner = []; // HOME BANNER
  List<CategoryList> homeGategorys = []; // HOME NAVIGATOR GATEGORY
  List<AnnountDataModel> annount = []; // SAVE ANNOUNT DATA
  List<String> annountTitle = []; // HOME DISPLAY ANNOUNT TITLE
  List<HotPageData> hotPageData = [];
  int total = 0; // HOME HOTGOODS PAGE TOTAL
  String noMoreStatus = ''; // NO MORE DATA
  //-BANNER
  homeDataList(HomeDataModel das) {
    homeBanner = das.banner;
    homeGategorys = das.categoryList;
    notifyListeners();
  }

  //-ANNOUNT
  annountList(AnnountModel item) {
    var das = item.data;
    annountTitle.clear();
    if (das.length > 0) {
      if (das.length > 3) {
        das.removeRange(3, das.length);
        for (int i = 0; i < das.length; i++) {
          annountTitle.add(das[i].title);
        }
      }
    } else {
      annountTitle.add('暂无内容');
    }
    annount = das;
    notifyListeners();
  }

  //-HOTGOODS
  hotGoodsList(HotGoodsDataModel item) {
    hotPageData = item.hotPageData;
    total = item.allPage;
    noMoreStatus = '';
    notifyListeners();
  }

  //-ADDHOTGOODS
  addHotGoodsList(HotGoodsDataModel item) {
    hotPageData.addAll(item.hotPageData);
    notifyListeners();
  }

  //-CHANGENOMOREDATA
  changeNoMore(String text) {
    noMoreStatus = text;
    notifyListeners();
  }

  // GET BANNER
  get getHomeBanner => homeBanner;
  // GET GATEGORY
  get getHomeGategory => homeGategorys;
  // GET ANNOUNT
  get getAnnountList => annount;
  // GET ANNOUNT TITLE
  get getAnnountTitle => annountTitle;
  // GET TOTAL PAGE
  get getTotalPage => total;
  // GET HOTGOODS List
  get getHotGoodsList => hotPageData;
  // GET HOME NO MORE
  get getHomeNoMore => noMoreStatus;
}
