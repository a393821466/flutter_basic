import 'package:flutter/material.dart';

class PaiBanAll extends StatelessWidget {

  // MainAxisAlignment和crossAxisAlignment
  List<Widget> _mainAxis=<Widget>[];
  Widget get MainAxisWidget{
    for(var i=0;i<=2;i++){
      _mainAxis.add(
        Container(
          width:120,
          height:120,
          alignment: Alignment(-1.0, 0), // 内部元素的位置
          color:Colors.red,
          // margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
          child:Container(
            child:Icon(Icons.menu,color: Colors.white,size:30)
          ),
        )
      );
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //平均分布在水平轴
        crossAxisAlignment:CrossAxisAlignment.end,
        children: _mainAxis,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('排版属性'),
      ),
      body: Column(
        children: <Widget>[
          MainAxisWidget,
          SizedBox(height:30.0),
          AspectRatio( // 容器宽高比
            aspectRatio: 1/1,
            child: Container(
              color:Colors.deepOrangeAccent
            ),
          ),
          SizedBox(height:30.0),
          ConstrainedBox( //带限制的容器
            constraints: BoxConstraints(
              minHeight: 80,
              minWidth: 200
            ),
            child: Container(
              color:Colors.purpleAccent
            ),
          )
        ],
      )
    );
  }
}