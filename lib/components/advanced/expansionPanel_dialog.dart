import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String title;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.title, this.body, this.isExpanded});
}

class ExpansionPanelDialog extends StatefulWidget {
  @override
  _ExpansionPanelDialogState createState() => _ExpansionPanelDialogState();
}

class _ExpansionPanelDialogState extends State<ExpansionPanelDialog> {
  bool _activeFlat = false;
  List<ExpansionPanelItem> _expansionPanelItem;

  // 公共方法
  _wrapExpansion(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback();
        }
      },
      child: child,
    );
  }

  // 初始化
  void initState() {
    super.initState();
    _expansionPanelItem = <ExpansionPanelItem>[
      ExpansionPanelItem(
          title: 'panel A',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('connet for panel A.'),
          ),
          isExpanded: false),
      ExpansionPanelItem(
          title: 'panel B',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('connet for panel B.'),
          ),
          isExpanded: false),
      ExpansionPanelItem(
          title: 'panel C',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('connet for panel C.'),
          ),
          isExpanded: false)
    ];
  }

  //单个expansion
  // _onPenExpanSion() {
  //   setState(() {
  //     _activeFlat = !_activeFlat;
  //   });
  // }
  // Widget get _ExpansionWidget{
  //   return _wrapExpansion(
  //     ExpansionPanelList(
  //       expansionCallback: (int index, bool isExpanded) {
  //         setState(() {
  //           _activeFlat = !isExpanded;
  //         });
  //       },
  //       children: [
  //         ExpansionPanel(
  //           headerBuilder: (BuildContext context, bool isExpanded) {
  //             return Container(
  //               padding: EdgeInsets.all(16),
  //               child: Text('panel a',
  //                   style: Theme.of(context).textTheme.title),
  //             );
  //           },
  //           body: Container(
  //             padding: EdgeInsets.all(16.0),
  //             width: double.infinity,
  //             child: Text('connet for panel A.'),
  //           ),
  //           isExpanded: _activeFlat,
  //         )
  //       ],
  //     ),
  //     _onPenExpanSion);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收缩面板'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _expansionPanelItem[index].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItem.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                  isExpanded: item.isExpanded,
                  body: item.body,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      child: Text('${item.title}',
                          style: Theme.of(context).textTheme.title),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
