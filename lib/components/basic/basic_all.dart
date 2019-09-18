import 'package:flutter/material.dart';

class BasicAll extends StatelessWidget {
  @override
  final TextStyle _textStyle=TextStyle(
    fontSize:18
  );
  // 单文字样式
  Widget get SingleTextStyleOne{
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text('这是文字的样式-达达萨德萨多大的萨达达萨德萨德萨顶顶萨达达是的撒打算打算打算打算打算的阿斯顿撒打算大的萨达达是',style:_textStyle,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,),
    );
  }

  // 多行文字样式
  Widget get MoreTextStyleOne{
    return Container(
      child: RichText(
        text:TextSpan(
          text: '多行字体样式',
          style: TextStyle(
            color:Colors.deepOrangeAccent,
            fontSize:16,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600
          ),
          children: [
            TextSpan(
              text: 'sadasas',
              style:TextStyle(
                fontSize:10
              )
            )
          ]
        )
      ),
    );
  }

  // Container容器
  Widget get ContainerBoxs{
    final List<Widget> _list=<Widget>[];
    for(var i=0;i<=3;i++){
      _list.add(
        Container(
          child: Icon(Icons.access_alarm,size:20,color: Colors.grey,),
          padding: EdgeInsets.all(8.0),
          margin:EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          width:60,
          height:60,
          decoration: BoxDecoration(
            color:Colors.yellow,
            border: Border.all(
              // top:BorderSide( //单独添加边框
              //   color:Colors.red,
              //   width:1.0,
              //   style:BorderStyle.solid
              // ),
              color:Colors.red, //统一添加边框
              width:1.0,
              style:BorderStyle.solid
            ),
            // borderRadius: BorderRadius.circular(5) //统一添加圆角
            // borderRadius:BorderRadius.only( // 单独添加圆角
            //   topLeft: Radius.circular(4),
            //   topRight: Radius.circular(4),
            // ),
            boxShadow: [ // 阴影
              BoxShadow(offset: Offset(3.0, 3.0),color:Color.fromRGBO(5, 10, 188, 1.0),
              blurRadius: 0.5,
              spreadRadius: 1 //扩散
              )
            ],
            shape: BoxShape.circle, //形状
            gradient: LinearGradient( //渐变
              colors: [
                Color.fromRGBO(7, 102,255, 1),
                Color.fromRGBO(3, 28, 128, 1),
              ],
              begin: Alignment.topCenter, //渐变开始
              end:Alignment.bottomLeft //渐变结束
            ),
          ),
        )
      );
    }
    return Container(
      // color: Colors.grey[400],
      decoration: BoxDecoration( //背景图像
        image:DecorationImage(
          image:AssetImage('images/banner1.jpg'),
          fit: BoxFit.cover,
          repeat:ImageRepeat.noRepeat,
          colorFilter: ColorFilter.mode(Colors.lightBlue[200].withOpacity(0.4),BlendMode.hardLight)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 主轴剧中
        children: _list,
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础小部件集合'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SingleTextStyleOne,
            MoreTextStyleOne,
            ContainerBoxs
          ],
        ),
      ),
    );
  }
}