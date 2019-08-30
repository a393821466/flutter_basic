import 'package:flutter/material.dart';
import './components/common/bottom_navigators.dart';
import 'package:provider/provider.dart';
import './store/classify_store.dart';

main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ClassifyStore>.value(value: ClassifyStore())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 75, 55, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.grey[200],
        child: BottomNavigators(),
      ),
    );
  }
}
