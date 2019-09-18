import 'package:flutter/material.dart';

class DrawerWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('侧边栏')
      ),
      drawer: Drawer(  //endDrawer右边显示
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   child: Text('dasdas'.toUpperCase()),
            //   decoration: BoxDecoration(
            //     color:Colors.grey[200]
            //   ),
            // ),
            UserAccountsDrawerHeader(
              accountName: Text('多多',style: TextStyle(fontWeight: FontWeight.w600),),
              accountEmail: Text('31321@qq.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:AssetImage('images/1.jpg')
              ),
              decoration: BoxDecoration(
                color:Colors.lightBlue[400],
                image:DecorationImage(
                  image: AssetImage('images/banner1.jpg'),
                  fit:BoxFit.fill,
                  colorFilter: ColorFilter.mode(Colors.lightBlue[400].withOpacity(0.6),BlendMode.hardLight)
                )
              ),
            ),
            ListTile(
              title: Text('首页'),
              trailing: Icon(Icons.home,size:20),
            ),
            ListTile(
              title: Text('啦啦'),
              trailing: Icon(Icons.label,size:20),
            ),
            ListTile(
              title: Text('设置'),
              trailing: Icon(Icons.settings,size:20),
            )
          ],
        ),
      ),
    );
  }
}