import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../config/ui_dpi.dart';
import '../../../components/common/navigatorShopCar/navigator_shop_car.dart';
import '../../../pages/shopcar_page.dart';

class ShopCarWidget extends StatefulWidget {
  ShopCarWidget();

  @override
  State<StatefulWidget> createState() {
    return _ShopCarWidgetState();
  }
}

class _ShopCarWidgetState extends State<ShopCarWidget>
    with TickerProviderStateMixin {
  AnimationController animationControllerExplore;
  CurvedAnimation curve;
  Animation<double> animation;
  Animation<double> animationW;
  Animation<double> animationR;
  get currentExplorePercent =>
      max(0.0, min(1.0, offsetExplore / (760.0 - 122.0)));
  get currentSearchPercent => max(0.0, min(1.0, offsetSearch / (347 - 68.0)));

  var offsetExplore = 0.0;
  var offsetSearch = 0.0;

  bool isExploreOpen = false;

  void onSearchHorizontalDragUpdate(details) {
    offsetSearch -= details.delta.dx;
    if (offsetSearch < 0) {
      offsetSearch = 0;
    } else if (offsetSearch > (347 - 68.0)) {
      offsetSearch = 347 - 68.0;
    }
    setState(() {});
  }

  /// explore drag callback
  void onExploreVerticalUpdate(details) {
    offsetExplore -= details.delta.dy;
    if (offsetExplore > 644) {
      offsetExplore = 644;
    } else if (offsetExplore < 0) {
      offsetExplore = 0;
    }
    setState(() {});
  }

  void animateExplore(bool open) {
    animationControllerExplore =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    curve =
        CurvedAnimation(parent: animationControllerExplore, curve: Curves.ease);
    animation = Tween(begin: offsetExplore, end: open ? 760.0 - 122 : 0.0)
        .animate(curve)
          ..addListener(() {
            setState(() {
              offsetExplore = animation.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              isExploreOpen = open;
            }
          });
    animationControllerExplore.forward();
  }
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        ExploreWidget(
          currentExplorePercent: currentExplorePercent,
          currentSearchPercent: currentSearchPercent,
          animateExplore: animateExplore,
          isExploreOpen: isExploreOpen,
          onVerticalDragUpdate: onExploreVerticalUpdate,
          onPanDown: () => animationControllerExplore?.stop(),
        ),
        // ShopCarPage(
        //   currentExplorePercent:currentExplorePercent
        // )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    super.dispose();
    animationControllerExplore?.dispose();
  }
}
