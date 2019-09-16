import 'package:flutter/material.dart';
import 'package:flutter_classify/store/shop_car_store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/dialog_utils.dart';
import '../../models/shoppingCarModel.dart';
import 'cart_count.dart';

class CartItem extends StatelessWidget {
  final ShoppingCarModel item;
  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 1.0,
            color: Colors.grey[200],
          ))),
      child: Row(
        children: <Widget>[
          _cartCheckBox(context, item),
          _cartImage(),
          _cartGoodsName(),
          _cartPrice(context)
        ],
      ),
    );
  }

  // 多选按钮
  Widget _cartCheckBox(context, item) {
    return Container(
      // child: Checkbox(
      //   value: item.isCheck,
      //   activeColor: Theme.of(context).primaryColor,
      //   onChanged: (bool val) {
      //     item.isCheck = val;
      //     Provider.of<ShopCarStore>(context).changeCheckState(item);
      //   },
      // ),
      width: 23,
      height: 23,
      margin: EdgeInsets.only(left: 5, right: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              width: 1,
              color: item.isCheck
                  ? Theme.of(context).primaryColor
                  : Colors.grey[400]),
          color: item.isCheck ? Theme.of(context).primaryColor : Colors.white),
      child: InkWell(
        onTap: () {
          item.isCheck = !item.isCheck;
          Provider.of<ShopCarStore>(context).changeCheckState(item);
        },
        child: item.isCheck
            ? Icon(
                Icons.check,
                size: 16.0,
                color: Colors.white,
              )
            : Icon(
                Icons.check_box_outline_blank,
                size: 16.0,
                color: Color.fromRGBO(255, 255, 255, 0),
              ),
      ),
    );
  }

  //商品图片
  Widget _cartImage() {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: Colors.black12)),
      child: Image.network(item.images),
    );
  }

  // 商品昵称
  Widget _cartGoodsName() {
    return Container(
      width: ScreenUtil().setWidth(300.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(300.0),
            alignment: Alignment.topLeft,
            child: Text(
              item.goodsName,
              style: TextStyle(fontSize: ScreenUtil().setSp(28)),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(300.0),
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            child: CartCount(item),
          )
        ],
      ),
    );
  }

  // 商品价格
  Widget _cartPrice(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('¥${item.price}'),
          Container(
            child: GestureDetector(
              onTap: () {
                DialogUtils().showOpenDialog(context, '提示', '确认移除该商品?', [
                  FlatButton(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('确认'),
                    onPressed: () {
                      Provider.of<ShopCarStore>(context)
                          .deleteSingleGoods(item.goodsId);
                      Navigator.pop(context);
                    },
                  )
                ]);
              },
              child:
                  Icon(Icons.delete_forever, color: Colors.black26, size: 30),
            ),
          )
        ],
      ),
    );
  }
}
