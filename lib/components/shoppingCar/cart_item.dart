import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/shoppingCarModel.dart';
import 'cart_count.dart';

class CartItem extends StatelessWidget {
  final ShoppingCarModel item;
  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
      decoration: BoxDecoration(
        color:Colors.white,
        border:Border(
          bottom:BorderSide(width:1.0,color:Colors.grey[200],)
        )
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBox(context,item),
          _cartImage(),
          _cartGoodsName(),
          _cartPrice()
        ],
      ),
    );
  }

  // 多选按钮
  Widget _cartCheckBox(context,item){
    return Container(
      child: Checkbox(
        value:item.isCheck,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (bool val){},
      ),
    );
  }

  //商品图片
  Widget _cartImage(){
    return Container(
      width:ScreenUtil().setWidth(150),
      padding:EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width:1.0,color:Colors.black12)
      ),
      child: Image.network(item.images),
    );
  }

  // 商品昵称
  Widget _cartGoodsName(){
    return Container(
      width:ScreenUtil().setWidth(300.0),
      padding:EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            width:ScreenUtil().setWidth(300.0),
            alignment: Alignment.topLeft,
            child: Text(item.goodsName,style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
          ),
          Container(
            width:ScreenUtil().setWidth(300.0),
            margin:EdgeInsets.only(top:10),
            alignment: Alignment.topLeft,
            child: CartCount(),
          )
        ],
      ),
    );
  }
  // 商品价格
  Widget _cartPrice(){
    return Container(
      width:ScreenUtil().setWidth(160),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('¥${item.price}'),
          Container(
            child: GestureDetector(
              onTap: (){},
              child: Icon(Icons.delete_forever,color:Colors.black26,size:30),
            ),
          )
        ],
      ),
    );
  }
}