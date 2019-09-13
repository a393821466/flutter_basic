import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utils/utils.dart';
import '../../store/goods_details_store.dart';

class GoodsSubComTwo extends StatelessWidget {
  List _favoriteNum(BuildContext context, int item) {
    List<Widget> list = new List();
    for (var i = 0; i < item; i++) {
      list.add(Icon(Icons.favorite,
          size: 20, color: Theme.of(context).primaryColor));
    }
    return list;
  }

  List _commentWidget(BuildContext context, List list) {
    var view = list.map((item) {
      return Column(
        children: <Widget>[
          Container(
            alignment: FractionalOffset(0, 0),
            width: ScreenUtil().setWidth(670),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(item.avatar),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(530),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('${item.userName}',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(32),
                                  color: Colors.grey[600])),
                          SizedBox(width: ScreenUtil().setWidth(15)),
                          Row(children: this._favoriteNum(context, item.score))
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(Utils.formartDate(item.discussTime),
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(28),
                                color: Colors.grey[400])),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: FractionalOffset(0, 0),
            width: ScreenUtil().setWidth(670),
            child: Text('${item.comments}',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(32), color: Colors.grey[600])),
          ),
          Container(
            height: ScreenUtil().setHeight(1),
            width: ScreenUtil().setWidth(670),
            color: Colors.grey[200],
            margin: EdgeInsets.only(top: 20, bottom: 20),
          )
        ],
      );
    }).toList();
    return view;
  }

  @override
  Widget build(BuildContext context) {
    List list = Provider.of<GoodsDetailsStore>(context).getCommentData;
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: list.length == 0
          ? Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(670),
              margin: EdgeInsets.only(top: 50, bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.sentiment_dissatisfied,
                      color: Colors.grey[300], size: 24),
                  Text('暂无评论',
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: ScreenUtil().setSp(28)))
                ],
              ),
            )
          : Column(
              children: this._commentWidget(context, list),
            ),
    );
  }
}
