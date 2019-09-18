import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
final APPBAR_OPACITY_NUMBER=100;
enum SearchBarType {home,normal,homeLight}
class OpacityPage extends StatefulWidget {
  final void Function() leftButton;
  final void Function() rightButton;
  final SearchBarType searchBarType;
  const OpacityPage({Key key,this.leftButton,this.rightButton,this.searchBarType=SearchBarType.normal}):super(key:key);
  @override
  State<StatefulWidget> createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  @override
  double _alphaAppBar=0;

  _onScroll(offset){
    double alpha=offset/APPBAR_OPACITY_NUMBER;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }
    setState(() {
      _alphaAppBar=alpha;
    });
  }
  List _imageUrls=['images/banner1.jpg','images/banner2.jpg','images/banner3.jpg','images/banner4.jpg'];
  // widget方法
  _wrapTab(Widget child,void Function() callback){
    return GestureDetector(
      onTap: (){
        if(callback!=null) callback();
      },
      child: child,
    );
  }

  // 左边按钮点击
  leftButton(){
    Navigator.pop(context);
  }

  // 轮播图
  Widget get _BannerSwiper{
    return Container(
      height:180,
      child: Swiper(
        itemCount: _imageUrls.length,
        itemBuilder: (BuildContext context,int index){
          return Image.asset(
            _imageUrls[index],
            fit:BoxFit.cover
          );
        },
        autoplay: true,
        pagination: SwiperPagination(),
      ),
    );
  }
  // 头部样式
  Widget get _NavigatorBarTop{
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[Color(0x66000000),Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            height:80.0,
            decoration: BoxDecoration(
              color:Color.fromARGB((_alphaAppBar*255).toInt(), 255, 255, 255)
            ),
            child: Container(
              child: Row(
                children: <Widget>[
                  _wrapTab(
                    Container(
                      padding:EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color:_alphaAppBar<0.6?Colors.white:Colors.grey,
                        size:22
                      ),
                    )
                  , leftButton),
                  Expanded(
                    flex:1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('渐变头部',style:TextStyle(fontSize:18,color:_alphaAppBar<0.6?Colors.white:Colors.grey,)),
                    )
                  ),
                  _wrapTab(
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Icon(
                        Icons.account_circle,
                        color:_alphaAppBar<0.6?Colors.white:Colors.grey,
                        size:26
                      ),
                    )
                  , widget.rightButton),
                ],
              ),
            ),
          ),
        ),
        Container(
          height:_alphaAppBar>0.2?0.5:0,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color:Colors.black12,blurRadius: 0.5)]
          ),
        )
      ],
    );
  }

  // 页面显示
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //移除顶部padding
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(removeTop: true, context: context,
            child: NotificationListener(
              onNotification: (ScrollNotification){
                // ScrollNotification is ScrollUpdateNotification 判断ScrollNotification如果是ScrollUpdateNotification就进行滚动
                // ScrollNotification.depth 找到第0个元素
                if(ScrollNotification is ScrollUpdateNotification && ScrollNotification.depth==0){
                  // 输出滚动位置
                  _onScroll(ScrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  _BannerSwiper,
                  Container(height:800.0,child:ListTile(title:Text('sss')),)
                ],
              ),
            )
          ),
          _NavigatorBarTop
        ],
      )
    );
  }
}
