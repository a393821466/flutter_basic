import 'package:flutter/material.dart';

// 复选框
class FormCheckBoxs extends StatefulWidget {
  @override
  _FormCheckBoxsState createState() => _FormCheckBoxsState();
}

class _FormCheckBoxsState extends State<FormCheckBoxs> {
  bool _checkBoxItemA = false;
  bool valuea = false;
  bool valueb = false;
  List _list = [
    {"label": "衣服", "value": false},
    {"label": "鞋子", "value": false}
  ];
  List _itemNum = [];
  List<Widget> _getCheckBoxList() {
    List<Widget> tempList = _list.map((item) {
      return Row(
        children: <Widget>[
          Checkbox(
            value: item['value'],
            activeColor: Colors.lightBlue,
            onChanged: (bool value) {
              if (!item['value']) {
                setState(() {
                  item['value'] = value;
                  _itemNum.add(item['label']);
                });
              } else {
                setState(() {
                  item['value'] = false;
                  _itemNum.remove(item['label']);
                });
              }
            },
          ),
          Text(item['label'])
        ],
      );
    }).toList();
    return tempList;
  }

  Widget get CheckBoxListGroup {
    return CheckboxListTile(
      value: _checkBoxItemA,
      onChanged: (value) {
        setState(() {
          _checkBoxItemA = value;
        });
      },
      title: Text('checkBox item A'),
      subtitle: Text('description'),
      secondary: Icon(Icons.bookmark),
      selected: _checkBoxItemA,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckBoxListGroup,
            Container(height: 1, color: Colors.grey[200]),
            Text('您选择了:$_itemNum'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: this._getCheckBoxList(),
            )
            // Row(
            //   children: <Widget>[
            //     Checkbox(
            //       value: _checkBoxItemB,
            //       onChanged: (value) {
            //         setState(() {
            //           _checkBoxItemB = !_checkBoxItemB;
            //         });
            //       },
            //       activeColor: Colors.grey,
            //     ),
            //     Text('C语言')
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
