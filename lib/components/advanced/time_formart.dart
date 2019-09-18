import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
// 日期格式化

class DateTimeFormart extends StatefulWidget {
  @override
  _DateTimeFormartState createState() => _DateTimeFormartState();
}

class _DateTimeFormartState extends State<DateTimeFormart> {
  DateTime selectDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);
  // 选择日期的对话框
  _selectDateTime() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(1900), // 之前的日期
      lastDate: DateTime(2100), // 未来的日期
    );
    if (date == null) return;
    setState(() {
      selectDate = date;
    });
  }

  Widget get _SelectTimeBox {
    return Container(
      height: 50,
      child: InkWell(
        onTap: _selectDateTime,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(new DateFormat.yMd().format(selectDate)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  // 时间选择器
  _selectTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (time == null) return;
    setState(() {
      selectedTime = time;
    });
  }

  Widget get _SelectTimeComputer {
    return Container(
      height: 50,
      child: InkWell(
        onTap: _selectTime,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(selectedTime.format(context)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('异步时间选择器')),
      body: Container(
        child: Column(
          children: <Widget>[
            _SelectTimeBox,
            Container(height: 1, color: Colors.grey[200]),
            _SelectTimeComputer,
          ],
        ),
      ),
    );
  }
}
