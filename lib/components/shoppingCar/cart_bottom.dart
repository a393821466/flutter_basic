import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color:Colors.white,
      child: Row(
        children: <Widget>[
          _allCheckBox(context),
          _allPriceArea(context),
          _buyButton(context)
        ],
      ),
    );
  }

  // 全选
  Widget _allCheckBox(context){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value:true,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool val){},
          ),
          Text('全选')
        ],
      )
    );
  }
  // 合计
  Widget _allPriceArea(context){
    return Container(
      width: ScreenUtil().setWidth(430),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  '合计:',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30)
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '¥ 1992',
                  style:TextStyle(
                    fontSize:ScreenUtil().setSp(36),
                    color:Theme.of(context).primaryColor
                  )
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text('满100元免配送费,预购免送配送费',style:TextStyle(
              color:Colors.black38,
              fontSize: ScreenUtil().setSp(22)
            )),
          )
        ],
      ),
    );
  }
  // 结算
  Widget _buyButton(context){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding:EdgeInsets.only(left:10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding:EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text('结算(2)',style: TextStyle(color:Colors.white),),
        ),
      ),
    );
  }
}