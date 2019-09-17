import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../store/home_store.dart';

class HotGoodsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(720),
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[hotTitle, _wrapList(context)],
      ),
    );
  }

  //标题
  Widget hotTitle = Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(60),
      padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey[200]))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('火爆专区',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 0, 54, 1),
                  fontSize: ScreenUtil().setSp(28))),
          InkWell(
            onTap: () {},
            child: Text(
              '更多>>',
              style: TextStyle(color: Colors.grey[600]),
            ),
          )
        ],
      ));
  // 内容
  Widget _wrapList(context) {
    List hotGoodslist = Provider.of<HomeStore>(context).getHotGoodsList;
    if (hotGoodslist.length != 0) {
      List<Widget> _listWidget = hotGoodslist.map((item) {
        return InkWell(
          onTap: () {
            print('1111');
          },
          child: Container(
            width: ScreenUtil().setWidth(340),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: <Widget>[
                Image.network(
                  item.images,
                  width: ScreenUtil().setWidth(298),
                ),
                SizedBox(height: 5),
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: ScreenUtil().setSp(26),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('￥${item.mallPrice}'),
                    Text(
                      '￥${item.price}',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: _listWidget,
      );
    } else {
      return Center(
        child: Text(''),
      );
    }
  }
}
