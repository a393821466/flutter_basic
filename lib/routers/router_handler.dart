import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../views/goodsPage/details_page.dart';
import '../utils/fluro_convert_util.dart';

// 声明一个Handler控制器
Handler detailsHandler = Handler(
  // handler方法
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    // 取值
    String goodsId = params["goodsId"]?.first;
    String images = params["images"]?.first;
    // 返回widget
    return DetailsPage(
      goodsId: goodsId,
      images: FluroConvertUtils.fluroCnParamsDecode(images),
    );
  },
);
