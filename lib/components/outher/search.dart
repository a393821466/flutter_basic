import 'package:flutter/material.dart';
import '../common/common_search.dart';
import '../../config/http_service.dart';
import '../../models/search_model.dart';

class SearchPage extends StatefulWidget {
  @override
  final String title;
  SearchPage({Key key, @required this.title}) : super(key: key);
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List searchList = [];
  _onTextChange(text) {}

  // List<Widget> _searchViewList(){
  //   List<Widget> _list = new List();
  //   for(int i=0;i<searchList.length;i++){
  //     _list.add(
  //       ListTile(
  // title: Text(
  //   '${searchList[i].districtname}',
  //   style: TextStyle(fontWeight: FontWeight.bold),
  // ),
  // subtitle: Text('${searchList[i].word}'),
  // leading: Icon(Icons.map, color: Colors.lightBlue),
  //       )
  //     );
  //   }
  //   return _list;
  // }

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('${widget.title}'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SearchBar(
              hideLeft: true,
              defaultText: '',
              hint: '1322',
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
            ),
            InkWell(
              onTap: () {
                // SreachDao.fetch(
                //         'https://m.ctrip.com/restapi/h5api/searchapp/search?sourch=mobileweb&action=autocomplete&contentType=json&keyword=长城')
                //     .then((SearchModel value) {
                //   setState(() {
                //     searchList = value.data;
                //   });
                //   print(MediaQuery.of(context).size.height);
                // });
                var das = {
                  'sourch': 'mobileweb',
                  'action': 'autocomplete',
                  'contentType': 'json',
                  'keyword': '北京'
                };

                http_get('mapList', das).then((res) {
                  SearchModel response = SearchModel.fromJson(res);
                  setState(() {
                    searchList = response.data;
                  });
                });
              },
              child: Text('获取'),
            ),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: searchList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(
                        '${searchList[index].districtname}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${searchList[index].word}'),
                      leading: Icon(Icons.map, color: Colors.lightBlue));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
