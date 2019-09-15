import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:ScreenUtil().setWidth(205),
      margin:EdgeInsets.only(top:5),
      decoration: BoxDecoration(
        border:Border.all(width:1,color:Colors.black12)
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(),
          _centerCount(),
          _addBtn()
        ],
      ),
    );
  }
  // 减按钮
  Widget _reduceBtn(){
    return InkWell(
      onTap: (){},
      child: Container(
        width:ScreenUtil().setWidth(60),
        height:ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:Colors.white,
          border: Border(
            right: BorderSide(width:1,color:Colors.black12)
          )
        ),
        child: Text('-'),
      ),
    );
  }

  // 加按钮
  Widget _addBtn(){
    return InkWell(
      onTap: (){},
      child: Container(
        width:ScreenUtil().setWidth(60),
        height:ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:Colors.white,
          border: Border(
            left: BorderSide(width:1,color:Colors.black12)
          )
        ),
        child: Text('+'),
      ),
    );
  }

  // 中间数量
  Widget _centerCount(){
    return Container(
      width:ScreenUtil().setWidth(80),
      height:ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color:Colors.white,
      child: Text('1'),
    );
  }
}