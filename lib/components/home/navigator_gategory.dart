import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../store/home_store.dart';

class NavigatorGategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List list = Provider.of<HomeStore>(context).getHomeGategory;
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(170),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: list.map((item) {
          return _getNavigatorViewList(context, item);
        }).toList(),
      ),
    );
  }

  Widget _getNavigatorViewList(context, item) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setSp(15)),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Image.network(
              item.imgUrl,
              height: ScreenUtil().setHeight(75),
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Text(item.content,
                style: TextStyle(
                    color: Colors.grey[800], fontSize: ScreenUtil().setSp(24)))
          ],
        ),
      ),
    );
  }
}
