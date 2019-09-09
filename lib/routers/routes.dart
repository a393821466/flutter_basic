import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  // 根路由
  static String root = '/';
  // 详情路由
  static String detailsPage = '/goodsDetail';
  // 路由配置方法
  static void configureRoutes(Router router) {
    // 找不到路由的时候
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('NO THIS IS ROUTER PAGE');
      },
    );
    // 配置路由
    router.define(detailsPage, handler: detailsHandler,transitionType:TransitionType.material);
  }
}
