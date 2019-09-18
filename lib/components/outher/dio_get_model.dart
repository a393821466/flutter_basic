import 'package:flutter/material.dart';
import '../../config/http_service.dart';
import '../../models/book_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookPageWidget extends StatefulWidget {
  @override
  _BookPageWidgetState createState() => _BookPageWidgetState();
}

class _BookPageWidgetState extends State<BookPageWidget> {
  List list = [];
  @override
  void initState() {
    _getBookList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dio的Get请求')),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: ListView(
          children: <Widget>[_bookWidget()],
        ),
      ),
    );
  }

  Widget _bookWidget() {
    if (list.length > 0) {
      List<Widget> _listWidget = list.map((item) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BookSubList(item)));
          },
          child: Container(
            color: Colors.white,
            width: ScreenUtil().setWidth(372),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 3),
            child: Column(
              children: <Widget>[
                Image.network(item.imgUrl,
                    fit: BoxFit.fill, height: ScreenUtil().setHeight(400)),
                Text(item.title),
                Text(item.autor)
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: _listWidget,
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    }
  }

  void _getBookList() {
    http_get('bookList').then((res) {
      final das = res['data'];
      BookModelToJson response = BookModelToJson.fromJson(das);
      setState(() {
        list = response.data;
      });
    });
  }
}

class BookSubList extends StatelessWidget {
  BookModel data;
  BookSubList(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.title}'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(300),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(3),
                  child: Image.network(data.imgUrl, fit: BoxFit.fill),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: ScreenUtil().setWidth(430),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${data.title}',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: ScreenUtil().setSp(52)),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${data.autor}',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: ScreenUtil().setSp(46)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
              indent: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(data.description,
                  style: TextStyle(fontSize: ScreenUtil().setSp(26))),
            )
          ],
        ),
      ),
    );
  }
}
