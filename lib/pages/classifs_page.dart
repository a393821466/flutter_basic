import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../config/http_utils.dart';
import '../models/classifyModel.dart';
import '../store/classify_store.dart';
import '../components/classify/left_navigator.dart';
import '../components/classify/sub_navigator.dart';
import '../models/categoryModel.dart';

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

// 商品分类的商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List categoryData = [];
  @override
  void initState() {
    _getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(590.0),
      height: ScreenUtil().setHeight(980.0),
      child: ListView.builder(
        itemCount: categoryData.length,
        itemBuilder: (BuildContext context, int index) {
          return _listItem(index);
        },
      ),
    );
  }

  // 图片
  Widget _goodsImage(int index) {
    return Container(
      width: ScreenUtil().setWidth(200.0),
      padding: EdgeInsets.all(8),
      child: Image.network(categoryData[index].images, fit: BoxFit.fill),
    );
  }

  Widget _goodsName(int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370.0),
      child: Column(
        children: <Widget>[
          Text(
            categoryData[index].goodsName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: ScreenUtil().setSp(28.0)),
          ),
          SizedBox(height: ScreenUtil().setHeight(30.0)),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text('价格￥:${categoryData[index].presentPrice}',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: ScreenUtil().setSp(30.0))),
              ),
              SizedBox(height: ScreenUtil().setHeight(30.0)),
              Text(
                '￥${categoryData[index].oriPrice}',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: ScreenUtil().setSp(26.0)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _listItem(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.black12),
            )),
        child: Row(
          children: <Widget>[
            _goodsImage(index),
            _goodsName(index),
          ],
        ),
      ),
    );
  }

  void _getGoodList() async {
    var data = {'categoryId': '1', 'categorySubId': '', 'page': 1};
    await http_get('categoryGoodList', data).then((res) {
      var das = res['data']['categoryData'];
      CategoryListModel _list = CategoryListModel.fromJson(das);
      setState(() {
        categoryData = _list.data;
      });
    });
  }
}
