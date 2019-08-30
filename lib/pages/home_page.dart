import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/http_utils.dart';
import '../components/home/swiper_banner_image.dart';
import '../components/home/search_widget.dart';
class HomePage extends StatefulWidget {
  final String title;
  HomePage(this.title);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List swiperData=[];
  final TextEditingController _controller=TextEditingController();
  @override
  void initState() {
    _getbannerDataList();
    super.initState();
  }
  _onChanged(String text){
    print(text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height:ScreenUtil().setHeight(54),
          padding:EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                size:ScreenUtil().setSp(50),
                color:Colors.grey[400]
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  onTap: (){
                    showSearch(context: context, delegate: sreachPages());
                  },
                  controller: _controller,
                  onChanged: _onChanged,
                  autofocus: false,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    color:Colors.black,
                    fontWeight: FontWeight.w300
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    border:InputBorder.none,
                    hintText: '搜你喜欢的...',
                    hintStyle: TextStyle(fontSize: ScreenUtil().setSp(26))
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.local_see),
                iconSize: ScreenUtil().setSp(48),
                color: Colors.grey[400],
                onPressed: (){},
              ),
            ],
          ),
        ),
        leading: InkWell(
          onTap: (){print('功能尚未完善');},
          child: Container(
            margin:EdgeInsets.only(left:ScreenUtil().setSp(15)),
            child: Column(
              children: <Widget>[
                SizedBox(height:5),
                Icon(Icons.filter_center_focus,size:ScreenUtil().setSp(52)),
                Text('扫一扫',style:TextStyle(fontSize: ScreenUtil().setSp(24)))
              ],
            ),
          )
        ),
        actions: <Widget>[
          InkWell(
            onTap: (){print('功能尚未完善');},
            child: Container(
              margin:EdgeInsets.only(right:ScreenUtil().setSp(20),left:ScreenUtil().setSp(20)),
              child: Column(
                children: <Widget>[
                  SizedBox(height:5),
                  Icon(Icons.map,size:ScreenUtil().setSp(52)),
                  Text('地区',style:TextStyle(fontSize: ScreenUtil().setSp(24)))
                ],
              ),
            )
          ),
          InkWell(
            onTap: (){print('功能尚未完善');},
            child: Container(
              margin:EdgeInsets.only(right:ScreenUtil().setSp(20),left:ScreenUtil().setSp(20)),
              child: Column(
                children: <Widget>[
                  SizedBox(height:5),
                  Icon(Icons.cast_connected,size:ScreenUtil().setSp(52)),
                  Text('会员码',style:TextStyle(fontSize: ScreenUtil().setSp(24)))
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color:Colors.grey[200],
        child: Column(
          children: <Widget>[
            getSwiperWidget()
          ],
        ),
      )
    );
  }
  void _getbannerDataList() async{
    await http_get('getHomeBanner').then((res){
      List list=res['data'];
      setState(() {
        swiperData.addAll(list);
      });
    });
  }
  getSwiperWidget(){
    if(swiperData.length>0){
      return SwiperBannerImage(swiperBannerList:swiperData);
    }else{
      return Container(
        alignment: Alignment.center,
        height:ScreenUtil().setHeight(220),
        child: Text('Loading...'),
      );
    }
  }
}

