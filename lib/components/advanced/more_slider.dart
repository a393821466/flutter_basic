import 'package:flutter/material.dart';

// 列表手风琴（未完成）
class ExpansionPanelListView extends StatefulWidget {
  @override
  _ExpansionPanelListViewState createState() => _ExpansionPanelListViewState();
}

class _ExpansionPanelListViewState extends State<ExpansionPanelListView> {
  List<int> mList;
  List<ExpandStateBean> expandStateList;
  // 实例化方法
  _ExpansionPanelListViewState() {
    mList = new List();
    expandStateList = new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }
  // 判断是否打开
  // _setCurrentIndex(int index, isExpand) {
  //   setState(() {
  //     if (expandStateList[index] == index) {
  //       expandStateList[index].isOpen = !isExpand;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('列表组')),
        body: Center(
          child: SingleChildScrollView(
            child: ExpansionPanelList(
              expansionCallback: (index, isExpaneded) {
                // _setCurrentIndex(index, isExpaneded);
              },
              children: mList
                  .map(
                    (index) => ExpansionPanel(
                        headerBuilder: (context, isExpaneded) =>
                            ListTile(title: Text('this is no.$index')),
                        body: ListTile(title: Text('expansion no.$index')
                            // 是否打开
                            ),
                        isExpanded: expandStateList[index].isOpen),
                  )
                  .toList(),
            ),
          ),
        ));
  }
}

// 控制打开关闭类
class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.isOpen, this.index);
}
