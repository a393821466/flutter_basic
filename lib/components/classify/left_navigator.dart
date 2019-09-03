import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../store/classify_store.dart';

// 左边导航
class LeftNavigatorList extends StatefulWidget {
  List navigatorList = [];
  LeftNavigatorList({Key key, this.navigatorList}) : super(key: key);
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
