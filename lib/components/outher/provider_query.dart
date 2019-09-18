import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../store/counter.dart';

class ProviderUseMethods extends StatefulWidget {
  @override
  _ProviderUseMethodsState createState() => _ProviderUseMethodsState();
}

class _ProviderUseMethodsState extends State<ProviderUseMethods> {
  @override
  Widget build(BuildContext context) {
    int count=Provider.of<CounterStore>(context).countQuery;
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider使用'),
      ),
      body:Center(
        child: Text('$count'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Provider.of<CounterStore>(context).add();
        },
      ),
    );
  }
}