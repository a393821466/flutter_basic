import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../models/categoryModel.dart';
import '../../store/classify_store.dart';
import '../../config/http_utils.dart';

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
            return _subNavigatorText(index, getProviderData[index]);
          },
        ),
      ),
    );
  }

  Widget _subNavigatorText(int index, Map<String, dynamic> item) {
    bool isClick = false;
    int idx = Provider.of<ClassifyStore>(context).getCurrentIndex;
    isClick = (index == idx) ? true : false;
    return InkWell(
      onTap: () {
        Provider.of<ClassifyStore>(context).changeCurrentIndex(index);
        _getGoodList(item['categorySubId']);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: isClick
                  ? Theme.of(context).primaryColor
                  : Color.fromRGBO(255, 255, 255, 0),
            ),
          ),
        ),
        padding: EdgeInsets.only(
          top: 10,
          left: 15,
          right: 10,
        ),
        child: Text(
          item['mallSubName'],
          style: TextStyle(
              fontSize: ScreenUtil().setSp(26),
              color: isClick ? Theme.of(context).primaryColor : Colors.black54),
        ),
      ),
    );
  }

  void _getGoodList(String categorySubId) {
    var data = {
      'categoryId': Provider.of<ClassifyStore>(context).getLeftNavigatorId,
      'categorySubId': categorySubId,
      'page': 1
    };
    http_get('categoryGoodList', data).then((res) {
      var das = res['data']['categoryData'];
      CategoryListModel goodList = CategoryListModel.fromJson(das);
      if (goodList.data == null) {
        Provider.of<ClassifyStore>(context).getGoodsList([]);
      } else {
        Provider.of<ClassifyStore>(context).getGoodsList(goodList.data);
      }
    });
  }
}
