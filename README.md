# 项目结构

```
  ├─android           //安卓工程目录
  │
  ├─images             //图片文件夹
  |
  |-ios             //ios工程目录
  |
  |-lib
  │  |
  │  ├─components   //组件
  │  |
  |  ├─config       //公共配置
  |  |
  |  ├─models      //数据模型
  |  |
  |  ├─pages       //所有的page
  |  |
  |  └store        //状态管理
  |
  └test            //测试文件
```

# Flutter 基础项目

## 前端数据来源

```
  数据生成:https://easy-mock.com/
  json格式化:http://bejson.com
  json转dart类:https://javiercbk.github.io/json_to_dart/
```

## Flutter 基础知识记录

### 记录的一些隐藏坑

- 解决键盘弹起出现益出问题
  > SingleChildScrollView(child:主元素)：在主元素 Container 前面加入,与 listView 有冲突
- 解决左中右底边的 padding 问题
  > MediaQuery.removePadding(removeTop: true,context: context,child:主元素,) ：把主元素写在 child 内
- 解决异步请求渲染

```
  FutureBuilder(future:异步方法,builder:(BuildContext context,snapshot){
    if(snapshot.hasData){
      // 如果存在值需要处理的方法
      var data=json.decode(snapshop.data.toString());
      List<Map> swiper=(data['data']['sliders'] as List).cast()
      return Column(
        children:<Widget>[
          SwiperBanner(swiperBannerList:swiper)
        ],
      )
    }else{
      return Center(child:Text('加载中...'))
    }
  })
```

### 表单使用

- TextField 的文本获取
  > TextEditingController textController=TextEditingController();
  > 获取: textController.text.toString()

### HTTP 请求 Dio 组件的使用

- GET 请求

```
  Future getHttp(String typeText) async {
    try {
      Response response;
      var data = {'name': typeText};
      response = await Dio().get(
      'https://easy-mock.com/mock/5d5fcd449fe02e63a21dd2b6/example/maple_text_get?', // 请求地址
      queryParameters: data); //传参
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
```

- POST 请求

```
   Future getHttp(String typeText) async {
    try {
      Response response;
      var data = {'name': typeText};
      Dio dio = new Dio();
      dio.options.headers = httpHeaders; // 伪造的请求头
      response = await Dio().get(
      'https://easy-mock.com/mock/5d5fcd449fe02e63a21dd2b6/example/maple_text_post', // 请求地址
      queryParameters: data); //传参
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
  其它获取请求头方法:使用 fiddler 组件
```

- 屏幕适配

```
  使用flutter_screenUtil组件
  ScreenUtil.instance=ScreenUtil(width:750,height:1334)..init(context); //设置默认宽度
  运用：
  (高度:ScreenUtil().setHeight(height:333);)
  (宽度::ScreenUtil().setHeight(width:750);)
  (字体:style:TextStyle(fontSize:ScreenUtil().setSp(28,false))
  (像素密度:ScreenUtil.pixelRatio)
  (设备的宽:ScreenUtil.screenHeight)
  (设备的高:ScreenUtil.screenWidth)
```

- 拨打电话，打开网页，邮件，短信等

```
  使用插件url_launcher；
  void _launchUrl() async{
    String url='tel'+电话; // 或者需要打开的网页
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'url不能访问';
    }
  }
```

- 保持页面状态

```
  保持页面状态必须要在需要保持状态的页面混入一个AutomaticKeepAliveClientMixin
  例如:
  1,class _HomePageState extends State<HomePage> width AutomaticKeepAliveClientMixin
  2,申明
  @override
  bool get wantKeepAlive=>true;
  @override
  void initState(){
    super.initState();
  }
  3,改变tab切换页面body
    IndexedStack(
      index: currentIndex,
      children: pages,
    )
```

- 下拉刷新上拉加载

```
  使用flutter_easyrefresh插件

```

- 贝塞尔曲线插件

```
  使用flutter_custom_clippers插件
```

- 数据模型生成和使用

```
生成:
  class CategoryBigModel {
  String mallCategoryId;    //类别编号
  String mallCategoryName;  //类别名称
  List<dynamic> bxMallSubDto;        //小类列表
  String image;             //类别图片
  Null comments;          //列表描述

  //构造函数
  CategoryBigModel({
    this.mallCategoryId,
    this.mallCategoryName,
    this.comments,
    this.image,
    this.bxMallSubDto
  });

  //工厂模式-用这种模式可以省略New关键字
  factory CategoryBigModel.fromJson(dynamic json){

    return CategoryBigModel(
      mallCategoryId:json['mallCategoryId'],
      mallCategoryName:json['mallCategoryName'],
      comments:json['comments'],
      image:json['image'],
      bxMallSubDto:json['bxMallSubDto']
    );
  }
}
// 列表模型
class CategoryBigListModel {
  List<CategoryBigModel> data;
  CategoryBigListModel(this.data);
  factory CategoryBigListModel.formJson(List json){
    return CategoryBigListModel(
      json.map((i)=>CategoryBigModel.fromJson((i))).toList()
    );
  }
}
使用:
//把数据传入到模型内
CategoryBigListModel list = CategoryBigListModel.formJson(data['data']);
//循环遍历数据
list.data.forEach((item)=>print(item.mallCategoryName));
```

- Provider 状态管理基础

```
  全部状态管理工具:Provide(旧)，Provider(新)，Scoped Model, Redux, Bloc
  provider使用：
  1.引入Provider
  2.建立provide/counts.dart:
    class Counts with ChangeNotifier{
      int value=0;
      //如果需要一开始接收一个 Counts(this.value);
      increment(){
        value++; // 状态改变
        notifyListeners(); //状态完成后通知听众
      }
      get count=value;  // 储存值
    }
  3.到main.dart的头部引入provide包和状态管理包
    > T：泛型值为provider内的类名
    //单个管理对象
    main(){
      runApp(ChangeNotifierProvider<T>.value(
        notifier: Counter(),
        child: MyApp(),
      ));
    }
    // 多个管理对象
    main(){
      runApp(MultiProvider(
        providers:[
          ChangeNotifierProvider<T>.value(value:count),
          ...
        ],
        child:MyApp()
      ))
    }
  4.获取状态管理内的值
    > context：泛型值为provide内的类名
    > T：泛型值为provide内的类名
    > counts：状态管理类名
    第一种方法:
    Provider.of<T>(context).counts
    第二种方法:
    return Consumer<T>(
      builder: (context, cart, child) => Container(
        child:Text('${cart.counts}')
      )
    );
  5.改变状态管理内的值
    T：泛型值为provide内的类名
    fuc：状态管理内部定义的方法

    Provider.of<T>(context).fuc();
```

- 企业级路由使用 (Fluro)

```
> 单个页面路由:建立一个文件(lib>routers>details_router.dart):
import 'package:fluro/fluro.dart';
import 'details_page.dart';
Handler detailsHandler = Handler(
  // handler方法
  handlerFunc: (BuildContext context, Map<String, List> params) {
    // 取值
    String paramsId = params['id'].first;
    // 返回带参数的widget
    return DetailsPage(paramsId);
  },
);

> 总体配置:创建一个文件(lib>routers>routes.dart):
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'details_router.dart';
class Routes {
  // 根路由
  static String root = '/';
  // 详情路由匹配路径
  static String detailsPage = '/details';
  // 路由配置方法
  static void configureRoutes(Router router) {
    // 找不到路由的时候
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('NO THIS IS ROUTER PAGE');
      },
    );
    // 配置路由对应页面
    router.define(detailsPage, handler: detailsHandler);
  }
}

> 静态化路由:创建一个文件(lib>routers>app_route.dart):
import 'package:fluro/fluro.dart';
class AppRoute{
  static Router router;
}

> 注入方式:
main.dart引入:
import 'package:fluro/fluro.dart';
// 初始化路由(widget在build的时候初始化)
final router=Router();
// 初始化路由的同时，全局注入路由
Routes.configureRoutes(router);
// 静态化路由
AppRouteInit.router=router;
// 在MaterialApp内注入静态化路由
MaterialApp(
  ...
  onGenerateRoute: AppRouteInit.router.generator,
  ...
);

> 使用方式:
AppRouteInit.router.navigatorTo(context,'路径地址如:/page?参数',)

```
