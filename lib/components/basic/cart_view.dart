import 'package:flutter/material.dart';
import '../../models/models.dart';

// 卡片列表
class CartView extends StatelessWidget {
  @override
  var card = Container(
    padding: EdgeInsets.all(16),
    child: ListView(
      children: posts.map(
        (item) {
          return Card(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.asset(item.imgUrl, fit: BoxFit.cover),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(item.imgUrl),
                  ),
                  title: Text(item.title),
                  subtitle: Text(item.author),
                ),
                Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      item.author,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Link'.toUpperCase()),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text('Look'.toUpperCase()),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ).toList(),
    ),
  );
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('卡片布局'),
        ),
        body: Center(
          child: card,
        ));
  }
}
