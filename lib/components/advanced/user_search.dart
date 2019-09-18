import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../common/common_search.dart';
import '../outher/search_http_get.dart';
final APPBAR_OPACITY_NUMBER=100;
final SEARCH_BAR_DEFAULT_TEXT='搜索你喜欢的...';
class UserSearchPage extends StatefulWidget {
  @override
  final String title;
  UserSearchPage({Key key,@required this.title}):super(key:key);
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  double _alphaAppBar=0;
  List _imageUrls=['images/banner1.jpg','images/banner2.jpg','images/banner3.jpg','images/banner4.jpg'];
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

  _jumpToSearch(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage(title:'搜索')));
  }

  _jumpToSpeak(){
    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage(title:'搜索')));
  }
  // banner图
  Widget get _BannerSWiper{
    return Container(
      height:180.0,
      child: Swiper(
        itemCount: _imageUrls.length,
        itemBuilder: (BuildContext context,int index){
          return Image.asset(
            _imageUrls[index],
            fit:BoxFit.cover
          );
        },
        autoplay:true,
        pagination:SwiperPagination() ,
      ),
    );
  }
  Widget get _SearchBarTop{
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
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
            child: SearchBar(
              searchBarType: _alphaAppBar>0.2?SearchBarType.homeLight:SearchBarType.home,
              inputBoxClick:_jumpToSearch,
              speakClick:_jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: (){},
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
                  _BannerSWiper,
                  Container(height:800.0,child:ListTile(title:Text('sss')),)
                ],
              ),
            )
          ),
          _SearchBarTop
        ],
      )
    );
  }
}
