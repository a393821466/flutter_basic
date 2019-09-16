import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/shoppingCarModel.dart';
import '../../store/shop_car_store.dart';

class CartCount extends StatelessWidget {
  final ShoppingCarModel item;
  CartCount(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(205),
      margin: EdgeInsets.only(top: 5),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),
          _centerCount(context, item),
          _addBtn(context)
        ],
      ),
    );
  }

  // 减按钮
  Widget _reduceBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ShopCarStore>(context).addorReduceActive(item, 'reduce');
      },
      child: Container(
        width: ScreenUtil().setWidth(60),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(right: BorderSide(width: 1, color: Colors.black12))),
        child: Text('-'),
      ),
    );
  }

  // 加按钮
  Widget _addBtn(context) {
    return InkWell(
      onTap: () {
        Provider.of<ShopCarStore>(context).addorReduceActive(item, 'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(60),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(left: BorderSide(width: 1, color: Colors.black12))),
        child: Text('+'),
      ),
    );
  }

  // 中间数量
  Widget _centerCount(context, item) {
    String count = item.count.toString();
    return Container(
      width: ScreenUtil().setWidth(80),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text(count),
    );
  }
}
