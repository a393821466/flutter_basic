import 'package:flutter/material.dart';

//搜索
const searchList = [
  'duoduo-多多小姐姐',
  'gg-哥哥',
  'prada-prada女包',
  'prada-prada男包',
  'prada-pradaT恤',
  'fendi-芬迪男包',
  'fendi-芬迪女包',
  'fendi-芬迪T恤'
];
const recantSuggest = ['推荐-1', '推荐-2'];

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: sreachBarDelegate());
            },
          )
        ],
      ),
    );
  }
}

// 搜索页面
class sreachBarDelegate extends SearchDelegate<String> {
  // 右边搜索按钮
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  // 左边回退按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      //带动画的icon
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  // 点击搜索后的数据
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? recantSuggest
        : searchList.where((i) => i.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionsList.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
            title: RichText(
              text: TextSpan(
                  text: suggestionsList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: suggestionsList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ]),
            ),
          ),
    );
  }
}