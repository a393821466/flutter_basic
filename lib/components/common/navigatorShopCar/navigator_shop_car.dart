import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/ui_dpi.dart';

class ExploreWidget extends StatelessWidget {
  final double currentSearchPercent;

  final double currentExplorePercent;

  final Function(bool) animateExplore;
  final Function(DragUpdateDetails) onVerticalDragUpdate;
  final Function() onPanDown;

  final bool isExploreOpen;
  final String title;
  final IconData icon;
  final Color color;
  const ExploreWidget(
      {Key key,
      this.currentSearchPercent,
      this.currentExplorePercent,
      this.animateExplore,
      this.isExploreOpen,
      this.onVerticalDragUpdate,
      this.title='',
      this.color=Colors.white,
      this.icon=Icons.shopping_cart,
      this.onPanDown})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    double moveW=ScreenUtil().setWidth(100);
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      child: Positioned(
      bottom:realH(-60*currentExplorePercent),
      left: (screenWidth - realW(55 + (standardWidth - 55) * currentExplorePercent)) / 2,
      child: GestureDetector(
        onTap: () {
          animateExplore(!isExploreOpen);
        },
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: (_) {
          _dispatchExploreOffset();
        },
        onPanDown: (_) => onPanDown(),
        child: Opacity(
          opacity: 1 - currentSearchPercent,
          child: Container(
            alignment: Alignment.bottomCenter,
            width:currentExplorePercent>0.0?realW(moveW + (standardWidth - moveW)*currentExplorePercent):realH(moveW + (moveW - moveW)*currentExplorePercent),
            height:currentExplorePercent>0.0?realH(moveW + (766 - moveW)*currentExplorePercent):realH(moveW + (moveW - moveW)*currentExplorePercent),
            decoration: BoxDecoration(
                color:Color.fromRGBO(255, (255* currentExplorePercent).toInt(), (255* currentExplorePercent).toInt(),1 - currentSearchPercent),
                borderRadius:BorderRadius.all(Radius.circular(currentExplorePercent>0.0?realW(40 + (20 - 40) * currentExplorePercent):realW(40 + (20 - 40) * currentExplorePercent))),
                border: Border.all(
                  width: 1,color:Colors.grey[200]
                )
                  ),
            child: Stack(
              children: [
                Positioned(
                    top: realH(45 + (-5 * currentExplorePercent)),
                    left: realW(20 + (91 - 20) * currentExplorePercent),
                    child: Text(
                      "${title}",
                      style: TextStyle(color: Colors.white, fontSize: realW(12 + (32 - 12) * currentExplorePercent)),
                    )),
                Positioned(
                    top: realH(16 + (60 - 15) * currentExplorePercent),
                    left: realW(15 + (44 - 15) * currentExplorePercent),
                    child: Icon(
                      icon,
                      size: ScreenUtil().setSp(52),
                      color:color,
                    )),
                Positioned(
                    top: realH(currentExplorePercent < 0.9
                        ? realH(-35)
                        : realH(-35 + (6 + 35) * (currentExplorePercent - 0.9) * 8)),
                    left: realW(63 + (170 - 63) * currentExplorePercent),
                    child: GestureDetector(
                      onTap: () {
                        animateExplore(false);
                      },
                      child: Icon(Icons.keyboard_arrow_down,size:realH(30),color:Colors.grey[500]),
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }

  /// dispatch Explore state
  ///
  /// handle it by [isExploreOpen] and [currentExplorePercent]
  void _dispatchExploreOffset() {
    if (!isExploreOpen) {
      if (currentExplorePercent < 0.3) {
        animateExplore(false);
      } else {
        animateExplore(true);
      }
    } else {
      if (currentExplorePercent > 0.6) {
        animateExplore(true);
      } else {
        animateExplore(false);
      }
    }
  }
}
