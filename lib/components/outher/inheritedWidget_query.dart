import 'package:flutter/material.dart';
// 跨组件传递参数
class CounterProvider extends InheritedWidget{
  final int count;
  final VoidCallback increaseCount;
  final Widget child;
  // 构造函数
  CounterProvider({
    this.count,
    this.increaseCount,
    this.child
  }):super(child:child);
  // 添加静态方法
  static CounterProvider of(BuildContext context)=>
    context.inheritFromWidgetOfExactType(CounterProvider);
  // 是否通知或重建小部件
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}


// ui小部件
class CounterView extends StatefulWidget {
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
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
        title:Text('跨组件传递参数')
      ),
      body: Container(
        child: CounterProvider(
          count: _count,
          increaseCount: _increaseCount,
          child: Counter()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );  
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取参数
    final int count=CounterProvider.of(context).count;
    final VoidCallback increaseCount=CounterProvider.of(context).increaseCount;
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}