import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import './routers/routes.dart'; // 引入路由配置文件
import './routers/app_route_init.dart'; // 引入路由静态化文件
import './components/common/navigator_list.dart';
import './store/classify_store.dart';
import './store/shop_car_store.dart';
import './store/goods_details_store.dart';

main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ClassifyStore>.value(value: ClassifyStore()),
      ChangeNotifierProvider<ShopCarStore>.value(value: ShopCarStore()),
      ChangeNotifierProvider<GoodsDetailsStore>.value(
          value: GoodsDetailsStore()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    AppRouteInit.router = router;
    return MaterialApp(
      title: 'App',
      // 使用该路由
      onGenerateRoute: AppRouteInit.router.generator,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 0, 54, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.grey[200],
        child: NavigatorListPage(),
      ),
    );
  }
}
