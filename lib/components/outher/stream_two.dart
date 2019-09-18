import 'package:flutter/material.dart';
import 'dart:async';
class StreamTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Stream')
      ),
      body:StreamDemoHome()
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  // 监听，暂停stream等
  StreamSubscription _streamSubscription;
  // 控制管理stream
  StreamController<String> _streamDemo;
  StreamSink _streamSink;
  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }
  @override
  void initState() {
    // 1.创建一个stream
    print('create stream before');
    _streamDemo=StreamController.broadcast();
    _streamSink=_streamDemo.sink;
    // 3.监听stream onData:stream有数据的时候执行，onerror：stream报错的时候执行，onDone：stream执行完成后
    print('open stream');
    _streamSubscription=_streamDemo.stream.listen(onDataTwo,onError: onError,onDone: onDone);

    print('stream after');
    super.initState();
  }
  // 4.方法内获取stream异步方法返回的数据
  void onDataTwo(String data){
    print('onDataTwo:$data');
  }
  // 错误后执行
  onError(error){
    print('error:${error}');
  }
  // 执行结束后
  onDone(){
    print('执行结束');
  }
  _addDataStream()async{
    print('添加数据到stream');
    String data=await fetchData();
    // _streamDemo.add(data);
    _streamDemo.add(data);
  }
  _openStream(){
    print('开始订阅');
    _streamSubscription.pause();
  }
  _restartStream(){
    print('恢复订阅');
    _streamSubscription.resume();
  }
  _cancelStream(){
    print('停止订阅');
    _streamSubscription.cancel();
  }
  // 2.定义一个stream异步方法
  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds:3));
    return 'hello';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: _streamDemo.stream,
            initialData: '...',
            builder: (context,snpshot){
              return Text('${snpshot.data}');
            },
          ),
          RaisedButton(
            child: Text('添加'),
            onPressed:_addDataStream,
          ),
          RaisedButton(
            child: Text('开始'),
            onPressed:_openStream,
          ),
          RaisedButton(
            child: Text('重启'),
            onPressed:_restartStream,
          ),
          RaisedButton(
            child: Text('停止'),
            onPressed:_cancelStream,
          ),
        ],
      ),
    );
  }
}