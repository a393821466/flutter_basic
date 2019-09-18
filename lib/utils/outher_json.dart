import 'package:flutter/material.dart';
import '../components/outher/router_break.dart';
import '../components/outher/router_query.dart';
import '../components/outher/router_async.dart';
import '../components/outher/search.dart';
import '../components/outher/parent_to_child.dart';
import '../components/outher/inheritedWidget_query.dart';
import '../components/outher/provider_query.dart';
import '../components/outher/scoped_models.dart';
import '../components/outher/stream_one.dart';
import '../components/outher/stream_two.dart';
import '../components/outher/convert_json.dart';
import '../components/outher/model_data.dart';
import '../components/outher/dio_get_model.dart';

List outherNum = [
  {"title": "路由跳转", "routerLink": RoutePages(), "icon": Icons.router},
  {"title": "异步路由", "routerLink": RouterHome(), "icon": Icons.router},
  {"title": "路由传参", "routerLink": RouterAsync(), "icon": Icons.router},
  {"title": "搜索栏", "routerLink": SearchPage(title: '搜索栏'), "icon": Icons.http},
  {"title": "父辈传递回调", "routerLink": AddCounts(), "icon": Icons.rotate_left},
  {
    "title": "跨组件传参数及回调",
    "routerLink": CounterView(),
    "icon": Icons.present_to_all
  },
  {
    "title": "Provider使用",
    "routerLink": ProviderUseMethods(),
    "icon": Icons.store
  },
  {
    "title": "scoped_model使用",
    "routerLink": CountWidgetCount(),
    "icon": Icons.storage
  },
  {
    "title": "stream(一次订阅)",
    "routerLink": StreamOne(),
    "icon": Icons.view_stream
  },
  {
    "title": "stream(多次订阅)",
    "routerLink": StreamTwo(),
    "icon": Icons.view_stream
  },
  {
    "title": "covert解析json",
    "routerLink": ConvertJsons(),
    "icon": Icons.data_usage
  },
  {"title": "model模型", "routerLink": ModelClassJson(), "icon": Icons.dns},
  {
    "title": "dio/model模型/解析数据",
    "routerLink": BookPageWidget(),
    "icon": Icons.dns
  }
];
