import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../store/classify_store.dart';

// 商品分类的商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List categoryDataList = Provider.of<ClassifyStore>(context).getCategoryData;
    if (categoryDataList.length != 0) {
      return Expanded(
        //继承flexible
        child: Container(
          width: ScreenUtil().setWidth(590.0),
          child: ListView.builder(
            itemCount: categoryDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return _listItem(categoryDataList, index);
            },
          ),
        ),
      );
    } else {
      return Container(
        child: Text('暂无内容..'),
      );
    }
  }

  // 图片
  Widget _goodsImage(List categoryDataList, int index) {
    return Container(
      width: ScreenUtil().setWidth(240.0),
      padding: EdgeInsets.all(8),
      child: Image.network(categoryDataList[index].images, fit: BoxFit.fill),
    );
  }

  Widget _goodsName(List categoryDataList, int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
      width: ScreenUtil().setWidth(330.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Text(
            categoryDataList[index].goodsName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: ScreenUtil().setSp(28.0)),
          ),
          SizedBox(height: ScreenUtil().setHeight(30.0)),
          Text('￥ ${categoryDataList[index].presentPrice}',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: ScreenUtil().setSp(26.0)),
              textAlign: TextAlign.left),
          Text(
            '￥ ${categoryDataList[index].oriPrice}',
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: ScreenUtil().setSp(24.0)),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _listItem(List categoryDataList, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.black12),
            )),
        child: Row(
          children: <Widget>[
            _goodsImage(categoryDataList, index),
            _goodsName(categoryDataList, index),
          ],
        ),
      ),
    );
  }
}
