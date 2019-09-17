import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vertical_marquee/flutter_vertical_marquee.dart';
import 'package:provider/provider.dart';
import '../../store/home_store.dart';

class AnountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = MarqueeController();
    List<String> annountTitle = Provider.of<HomeStore>(context).getAnnountTitle;
    return Container(
      height: ScreenUtil().setHeight(60),
      width: ScreenUtil().setWidth(720),
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(60),
              child: Icon(Icons.volume_down,
                  size: ScreenUtil().setSp(48),
                  color: Theme.of(context).primaryColor),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              width: ScreenUtil().setWidth(540),
              child: Marquee(
                textList: annountTitle,
                scrollDuration: Duration(seconds: 1),
                stopDuration: Duration(seconds: 3),
                tapToNext: false,
                textColor: Colors.black,
                controller: controller,
              ),
            )
          ],
        ),
      ),
    );
  }
}
