import 'package:flutter/material.dart';
import '../components/advanced/time_formart.dart';
import '../components/advanced/simple_dialog.dart';
import '../components/advanced/alert_dialog.dart';
import '../components/advanced/bottom_dialog.dart';
import '../components/advanced/snackBar_dialog.dart';
import '../components/advanced/expansionPanel_dialog.dart';
import '../components/advanced/animation_view.dart';
import '../components/advanced/bezierCurve_one.dart';
import '../components/advanced/bezierCurve_tow.dart';
import '../components/advanced/draggable_box.dart';
import '../components/advanced/frosted_box.dart';
import '../components/advanced/opacity_header.dart';
import '../components/advanced/open_animate.dart';
import '../components/advanced/right_back.dart';
import '../components/advanced/sliver_grid.dart';
import '../components/advanced/sliver_list_widget.dart';
import '../components/advanced/user_search.dart';
List advancedCom = [
  {"routerLink": DateTimeFormart(), "title": '异步时间选择器', "icon": Icons.timer},
  {
    "routerLink": SimpleDialogBox(),
    "title": '简单对话框',
    "icon": Icons.sim_card_alert
  },
  {
    "routerLink": AlertDialogBox(),
    "title": '对话框 (Alert)',
    "icon": Icons.add_alert
  },
  {"routerLink": BottomDialogBox(), "title": '底部对话框', "icon": Icons.cake},
  {"routerLink": SnackBarDialog(), "title": '操作状态栏', "icon": Icons.info},
  {
    "routerLink": ExpansionPanelDialog(),
    "title": '收缩面板',
    "icon": Icons.view_agenda
  },
  {
    "routerLink": FirstPage(),
    "title": '切换动画',
    "icon": Icons.flash_auto
  },
  {
    "title": "贝塞尔曲线一",
    "routerLink": BezierCurveOne(),
    "icon": Icons.trending_up
  },
  {
    "title": "贝塞尔曲线二",
    "routerLink": BezierCurveTwo(),
    "icon": Icons.call_missed
  },
  {"title": "拖拽效果", "routerLink":DraggableView(), "icon": Icons.image},
  {"title": "毛玻璃效果", "routerLink":Frosted(), "icon": Icons.flash_auto},
  {
    "title": "渐变头部1",
    "routerLink": OpacityPage(),
    "icon": Icons.space_bar
  },
  {"title": "渐变头部2", "routerLink": UserSearchPage(title:'自定义搜索'), "icon": Icons.space_bar},
  {"title": "开场动画", "routerLink": SplashScreen(), "icon": Icons.compare},
  {"title": "左滑右滑", "routerLink": RightBackPage(), "icon": Icons.flip},

  {
    "title":"可视口网格",
    "routerLink":SliverGridBox(),
    "icon":Icons.view_comfy
  },{
    "title":"可视口列表",
    "routerLink":SliverListBox(),
    "icon":Icons.list
  },
];
