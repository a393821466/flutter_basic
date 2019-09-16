import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../store/shop_car_store.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey[200]),
        ),
      ),
      child: Consumer<ShopCarStore>(
        builder: (context, val, _) {
          return Row(
            children: <Widget>[
              _allCheckBox(context),
              _allPriceArea(context),
              _buyButton(context)
            ],
          );
        },
      ),
    );
  }

  // 全选
  Widget _allCheckBox(context) {
    bool isAllCheck = Provider.of<ShopCarStore>(context).isAllCheck;
    return Container(
        child: Row(
      children: <Widget>[
        Container(
          width: 23,
          height: 23,
          margin: EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  width: 1,
                  color: isAllCheck
                      ? Theme.of(context).primaryColor
                      : Colors.grey[400]),
              color:
                  isAllCheck ? Theme.of(context).primaryColor : Colors.white),
          child: InkWell(
            onTap: () {
              isAllCheck = !isAllCheck;
              Provider.of<ShopCarStore>(context).changeAllCheckBox(isAllCheck);
            },
            child: isAllCheck
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
        ),
        Text('全选')
      ],
    ));
  }

  // 合计
  Widget _allPriceArea(context) {
    double allPrice = Provider.of<ShopCarStore>(context).allGoodsPrice;
    return Container(
      width: ScreenUtil().setWidth(430),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(250),
                child: Text(
                  '合计:',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(180),
                child: Text(
                  '¥${allPrice}',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(36),
                      color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text('满100元免配送费,预购免送配送费',
                style: TextStyle(
                    color: Colors.black38, fontSize: ScreenUtil().setSp(22))),
          )
        ],
      ),
    );
  }

  // 结算
  Widget _buyButton(context) {
    int allGoodsCount = Provider.of<ShopCarStore>(context).allGoodsNum;
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(3.0)),
          child: Text(
            '结算(${allGoodsCount})',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
