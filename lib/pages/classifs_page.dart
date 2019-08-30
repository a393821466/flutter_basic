import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../config/http_utils.dart';
import '../models/classifyModel.dart';
import '../store/classify_store.dart';

class ClassifsPage extends StatefulWidget {
  final String title;
  ClassifsPage(this.title);
  @override
  _ClassifsPageState createState() => _ClassifsPageState();
}

class _ClassifsPageState extends State<ClassifsPage> {
  List list = [];

  @override
  void initState() {
    _sendClassifyNavigatorList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}')),
      body: Center(
        child: _getListWidget()
      ),
    );
  }
  Widget _getListWidget(){
    if(list.length>0){
      return Container(
        child: Row(
          children: <Widget>[
            LeftNavigatorList(navigatorList:list),
            Column(
              children: <Widget>[SubNavigator()],
            )
          ],
        ),
      );
    }else{
      return Container(
        child: CircularProgressIndicator(),
      );
    }
  }
  //发送http请求
  void _sendClassifyNavigatorList() async {
    await http_get('classifyApi').then((res) {
      var data = res['data'];
      ClassifyListModel classifyData = ClassifyListModel.formJson(data);
      setState(() {
        list = classifyData.data;
      });
      //进入类别自动触发索引
      Provider.of<ClassifyStore>(context).classIfyFunc(list[0].bxMallSubDto);
    });
  }
}

// 左边导航
class LeftNavigatorList extends StatefulWidget {
  List navigatorList=[];
  LeftNavigatorList({Key key,this.navigatorList}):super(key:key);
  @override
  _LeftNavigatorListState createState() => _LeftNavigatorListState();
}

class _LeftNavigatorListState extends State<LeftNavigatorList> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: widget.navigatorList.length,
        itemBuilder: (BuildContext context, int index) {
          return getSingleNavigator(index);
        },
      ),
    );
  }

  Widget getSingleNavigator(int index) {
    bool isClick = false;
    isClick = (index == currentIndex) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
        var subNavigatorList = widget.navigatorList[index].bxMallSubDto;
        Provider.of<ClassifyStore>(context).classIfyFunc(subNavigatorList);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isClick ? Colors.grey[200] : Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey[200], width: 1),
          ),
        ),
        child: Text(
          widget.navigatorList[index].mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }
}

/*
**子导航
**/
class SubNavigator extends StatefulWidget {
  @override
  _SubNavigatorState createState() => _SubNavigatorState();
}

class _SubNavigatorState extends State<SubNavigator> {
  @override
  Widget build(BuildContext context) {
    List getProviderData = Provider.of<ClassifyStore>(context).classIfyListData;
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(590),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      child: Container(
        height: ScreenUtil().setHeight(100),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: getProviderData.length,
          itemBuilder: (BuildContext context, int index) {
            return _subNavigatorText(getProviderData[index]);
          },
        ),
      ),
    );
  }

  Widget _subNavigatorText(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 15,
          right: 10,
        ),
        child: Text(
          item['mallSubName'],
          style:
              TextStyle(fontSize: ScreenUtil().setSp(26), color: Colors.grey),
        ),
      ),
    );
  }
}
