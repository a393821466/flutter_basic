import 'package:flutter/material.dart';
// 路由传参

// 商品类
class Prodcut {
  final String title;
  final String des;
  Prodcut(this.title, this.des);
}

// 初始页
class RouterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RouterQuery(
        prodcuts: List.generate(50, (i) => Prodcut('编号为$i', '商品详情')));
  }
}

// 列表页面
class RouterQuery extends StatelessWidget {
  final List<Prodcut> prodcuts;
  RouterQuery({Key key, @required this.prodcuts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('路由传参'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: prodcuts.length,
            itemBuilder: (context, int index) {
              return ListTile(
                leading: Icon(Icons.account_box),
                title: Text(prodcuts[index].title),
                onTap: () {
                  // 路由传递参数
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   BreakRouterList(product: prodcuts[index]);
                  // }));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BreakRouterList(product: prodcuts[index])));
                },
              );
            },
          ),
        ));
  }
}

// 详情页面
class BreakRouterList extends StatelessWidget {
  //接收路由参数
  final Prodcut product;
  BreakRouterList({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('${product.title}')),
          body: Center(
            child: Container(
              child: Text('${product.des}'),
            ),
          )),
    );
  }
}
