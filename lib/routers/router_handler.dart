import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../views/goodsPage/details_page.dart';

// 声明一个Handler控制器
Handler detailsHandler = Handler(
  // handler方法
  handlerFunc: (BuildContext context, Map<String, List> params) {
    // 取值
    String goodsId = params['id'].first;
    // 返回widget
    return DetailsPage(goodsId);
  },
);
