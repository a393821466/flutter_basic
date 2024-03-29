import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/http_service.dart';
import '../../models/classifyModel.dart';
import '../../store/classify_store.dart';
import '../../store/currentIndex.dart';
import '../../components/classify/left_navigator.dart';
import '../../components/classify/sub_navigator.dart';
import '../../components/classify/category_goods_list.dart';

class ClassifsPage extends StatefulWidget {
  final String title;
  ClassifsPage(this.title);
  @override
  _ClassifsPageState createState() => _ClassifsPageState();
}

class _ClassifsPageState extends State<ClassifsPage> {
  List list = [];
  bool flat=true;
  @override
  void initState() {
    super.initState();
  }

  void _autoSendClassify(){
    int idx=Provider.of<CurrentIndexStore>(context).getCurIdx;
    if(idx==1 && flat){
      _sendClassifyNavigatorList();
    }
  }

  @override
  Widget build(BuildContext context) {
    _autoSendClassify();
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}')),
      body: Center(child: _getListWidget()),
    );
  }

  Widget _getListWidget() {
    if (list.length > 0) {
      return Container(
        child: Row(
          children: <Widget>[
            LeftNavigatorList(navigatorList: list),
            Column(
              children: <Widget>[
                SubNavigator(),
                CategoryGoodsList(),
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        child: CircularProgressIndicator(),
      );
    }
  }

  //发送http请求
  void _sendClassifyNavigatorList() async {
    await HttpUtils().get('classifyApi').then((res) {
      var data = res['data'];
      ClassifyListModel classifyData = ClassifyListModel.formJson(data);
      setState(() {
        list = classifyData.data;
      });
      flat=false;
      //进入类别自动触发索引
      Provider.of<ClassifyStore>(context)
          .classIfyFunc(list[0].bxMallSubDto, list[0].mallCategoryId);
    });
  }
}
