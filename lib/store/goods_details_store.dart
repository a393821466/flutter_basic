import 'package:flutter/material.dart';
import '../models/goodsDetailsModel.dart';

class GoodsDetailsStore with ChangeNotifier{
  GoodInfoModel goodsList;
  List<GoodComments> goodsComment=[];
  AdvertesPicture advertesPicture;
  bool flat=false;
  goodsListDataFuc(GoodsDetailsModel json){
    flat=false;
    goodsList=json.data[0].goodInfo;
    goodsComment=json.data[0].goodComments;
    advertesPicture=json.data[0].advertesPicture;
    notifyListeners();
  }
  restartBool(bool f){
    flat=f;
    notifyListeners();
  }
  get getDetailsData => goodsList;
  get getCommentData => goodsComment;
  get getAdvertes => advertesPicture;
  get boolflat => flat;
}