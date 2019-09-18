import 'package:flutter/material.dart';

class BarJson {
  final String title;
  final icon;
  double fontSized;
  BarJson({this.title, this.icon, this.fontSized});
}

final List<BarJson> menuList = [
  BarJson(title: '基础', icon: Icons.grain, fontSized: 24.0),
  BarJson(title: '高级', icon: Icons.device_hub, fontSized: 24.0),
  BarJson(title: '状态', icon: Icons.star, fontSized: 24.0),
  BarJson(title: '媒体', icon: Icons.videocam, fontSized: 24.0),
  BarJson(title: '其它', icon: Icons.widgets, fontSized: 24.0)
];
