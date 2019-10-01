import 'package:flutter/material.dart';
import 'package:flutter_classify/store/information_store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/http_service.dart';
import '../../models/informationModel.dart';

class InformationPage extends StatefulWidget {
  final String title;
  InformationPage(this.title);
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final List<Tab> listTab = <Tab>[
    Tab(text: '热点'),
    Tab(text: '发现'),
    Tab(text: '有货')
  ];

  @override
  void initState() {
    _getInformationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}')),
      body: _informationAll(),
    );
  }

  // 资讯主体
  Widget _informationAll() {
    var getTabList = Provider.of<InformationStore>(context).getTabsList;
    return getTabList.length <= 0
        ? Text('加载..')
        : DefaultTabController(
            length: getTabList.length,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.5,
                  title: TabBar(
                    tabs: getTabList.map<Widget>((item) {
                      return Tab(text: item['navTitle']);
                    }).toList(),
                    unselectedLabelColor: Colors.grey[500],
                    indicatorColor: Theme.of(context).primaryColor,
                    indicatorWeight: 2.0,
                    labelColor: Theme.of(context).primaryColor,
                    isScrollable: true,
                    onTap: (item) {
                      // Provider.of<InformationStore>(context)
                      //     .filterInformationList(getTabList[item]['navTitle']);
                    },
                  ),
                ),
                body: TabBarView(
                  children: getTabList.map<Widget>((item) {
                    return Container(
                      width: ScreenUtil().setWidth(750),
                      height: ScreenUtil().setHeight(160),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color: Colors.grey[100],
                              style: BorderStyle.solid),
                        ),
                      ),
                      child: ListView(
                          children: item['navList'].map<Widget>((item) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.grey[200]))),
                          child: _getInfoMations(item),
                        );
                      }).toList()),
                    );
                  }).toList(),
                )),
          );
  }

  // 资讯图片和文字
  Widget _getInfoMations(item) {
    return Row(
      children: <Widget>[_getInformationImg(item), _getInformationTxt(item)],
    );
  }

  // 资讯图片
  Widget _getInformationImg(item) {
    return Container(
      width: ScreenUtil().setWidth(220),
      height: ScreenUtil().setHeight(160),
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Image.network(item.image,
          fit: BoxFit.fill,
          width: ScreenUtil().setWidth(220),
          height: ScreenUtil().setHeight(160)),
    );
  }

  // 资讯文字
  Widget _getInformationTxt(item) {
    return Container(
      width: ScreenUtil().setWidth(480),
      height: ScreenUtil().setHeight(160),
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 10),
            child: Text(
              item.title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Text(item.createTime,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[500],
                    )),
                SizedBox(width: ScreenUtil().setWidth(30)),
                Text('浏览量:${item.ratings}',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _getInformationData() async {
    await HttpUtils().get('information').then((res) {
      var data = res['data'];
      InfomationDataModel list = InfomationDataModel.fromJson(data);
      Provider.of<InformationStore>(context).getInformationList(list);
    });
  }
}
