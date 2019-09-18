import 'package:flutter/material.dart';
import './components/common/navigator_tarbar.dart';
import 'package:provider/provider.dart';
import './store/counter.dart';

void main(){
  Provider.debugCheckInvalidValueType=null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterStore>.value(value:CounterStore())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
      home: NavigatorBarTab(),
    );
  }
}
