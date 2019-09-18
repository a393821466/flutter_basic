import 'package:flutter/material.dart';

// 父辈传递回调
class AddCounts extends StatefulWidget {
  @override
  _AddCountsState createState() => _AddCountsState();
}

class _AddCountsState extends State<AddCounts> {
  int _count=0;

  _increaseCount(){
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('父辈传递回调'),
      ),
      body:Center(
        child: CounsQuery(_count,_increaseCount),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );
  }
}

class CounsQuery extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  CounsQuery(this.count,this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}