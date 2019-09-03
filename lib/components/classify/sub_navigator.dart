import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../store/classify_store.dart';

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
          style: TextStyle(
              fontSize: ScreenUtil().setSp(26), color: Colors.black54),
        ),
      ),
    );
  }
}
