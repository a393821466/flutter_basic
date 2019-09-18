import 'package:flutter/material.dart';
import '../components/basic/basic_all.dart';
import '../components/basic/floating_button.dart';
import '../components/basic/popup_menu_button.dart';
import '../components/basic/isScroll_navigator.dart';
import '../components/basic/no_isScroll_Navigator.dart';
import '../components/basic/single_slider.dart';
import '../components/basic/cart_view.dart';
import '../components/basic/column_view.dart';
import '../components/basic/drawer_widget.dart';
import '../components/basic/dymain_list.dart';
import '../components/basic/list_view_vertical.dart';
import '../components/basic/grid_view.dart';
import '../components/basic/list_view_horizontal.dart';
import '../components/basic/page_view_widget.dart';
import '../components/basic/stack_view.dart';
import '../components/basic/toolTip_model.dart';
import '../components/basic/wrap_view.dart';
import '../components/basic/tag_table_wraps.dart';

List comBasic = [
  {
    "routerLink": BasicAll(),
    "title": '文字/装饰器等',
    "icon": Icons.settings_brightness
  },
  {
    "routerLink": ColumnWidget(),
    "title": '垂直布局',
    "icon": Icons.format_align_center
  },
  {
    "routerLink": ClipBoxWidget(),
    "title": '小碎片集合',
    "icon": Icons.lightbulb_outline
  },
  {"routerLink": FloatingButtonWidget(), "title": '漂浮按钮', "icon": Icons.add},
  {
    "routerLink": PopupMenuButtonWidget(),
    "title": '弹出式按钮',
    "icon": Icons.store
  },
  {
    "title": "可滚动的Tab",
    "routerLink": MyTabNavigator(),
    "icon": Icons.line_style
  },
  {
    "title": "不可滚动的Tab",
    "routerLink": KeepAliveDemo(),
    "icon": Icons.line_style
  },
  {"title": "手风琴", "routerLink": SingleEXpansionTile(), "icon": Icons.view_day},
  {
    "routerLink": CartView(),
    "title": '卡片列表',
    "icon": Icons.format_list_bulleted
  },
  {"routerLink": DrawerWidgets(), "title": '侧边栏导航', "icon": Icons.menu},
  {"routerLink": ListApp(), "title": '列表1', "icon": Icons.reorder},
  {"routerLink": ListViewVer(), "title": '列表2', "icon": Icons.reorder},
  {"routerLink": GridViewList(), "title": '网格列表', "icon": Icons.view_comfy},
  {"title": "横向列表", "routerLink": ListViewHor(), "icon": Icons.view_week},
  {"title": "页面视图", "routerLink": PageViewWidget(), "icon": Icons.pages},
  {"title": "层叠", "routerLink": StackView(), "icon": Icons.picture_in_picture},
  {"title": "轻弹窗", "routerLink": ToolTipModel(), "icon": Icons.add_alert},
  {"title": "流布局", "routerLink": WrapView(), "icon": Icons.view_module}
];
