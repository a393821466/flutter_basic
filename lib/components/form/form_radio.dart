import 'package:flutter/material.dart';

// 单选框
class FormRadioList extends StatefulWidget {
  @override
  _FormRadioListState createState() => _FormRadioListState();
}

class _FormRadioListState extends State<FormRadioList> {
  int _radioIndex = 0;
  int _radioIndex2 = 0;
  _handleRadioValueChangged(value) {
    setState(() {
      _radioIndex = value;
    });
  }

  Widget get RedioList {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioIndex,
              onChanged: _handleRadioValueChangged,
              activeColor: Colors.lightBlue,
            ),
            Text('男')
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _radioIndex,
              onChanged: _handleRadioValueChangged,
              activeColor: Colors.lightBlue,
            ),
            Text('女')
          ],
        )
      ],
    );
  }

  // RadioTitle
  Widget get RadioTitleList {
    return Column(
      children: <Widget>[
        RadioListTile(
          value: 0,
          groupValue: _radioIndex2,
          onChanged: (value) {
            setState(() {
              _radioIndex2 = value;
            });
          },
          title: Text('optionA'),
          subtitle: Text('Description'),
          secondary: Icon(Icons.book),
          selected: _radioIndex2 == 0,
        ),
        RadioListTile(
          value: 1,
          groupValue: _radioIndex2,
          onChanged: (value) {
            setState(() {
              _radioIndex2 = value;
            });
          },
          title: Text('optionA'),
          subtitle: Text('Description'),
          secondary: Icon(Icons.book),
          selected: _radioIndex2 == 1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Radio'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text('RadioNumber:${_radioIndex}'),
              RedioList,
              Container(height: 1, color: Colors.grey[200]),
              SizedBox(height: 20),
              Text('RadioGroupNum:${_radioIndex2}'),
              RadioTitleList,
            ],
          ),
        ));
  }
}
