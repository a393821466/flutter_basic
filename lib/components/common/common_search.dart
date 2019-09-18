import 'package:flutter/material.dart';

enum SearchBarType {home,normal,homeLight} // 三种类型
class SearchBar extends StatefulWidget{
  final bool enabled; // 是否进行搜索
  final bool hideLeft; // 左边按钮是否隐藏
  final SearchBarType searchBarType; // 搜索框类型
  final String hint; // 默认提示文案
  final String defaultText; //
  final void Function() leftButtonClick; // 左边的点击按钮回调
  final void Function() rightButtonClick; // 右边的点击按钮回调
  final void Function() speakClick;
  final void Function() inputBoxClick;

  final ValueChanged<String> onChanged;

  const SearchBar({Key key,this.enabled=true,this.hideLeft,this.searchBarType=SearchBarType.normal,this.hint,this.defaultText,this.leftButtonClick,this.rightButtonClick,this.speakClick,this.inputBoxClick,this.onChanged}):super(key:key);
  @override
  _SearchBarState createState() =>_SearchBarState();
}

class _SearchBarState extends State<SearchBar>{
  bool showClear=false;
  final TextEditingController _controller=TextEditingController();
  @override

  void initState(){
    if(widget.defaultText!=null){
      setState(() {
        _controller.text=widget.defaultText;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return widget.searchBarType==SearchBarType.normal?_genNormalSearch():_genHomeSearch();
  }
  // 搜索页面的输入框
  _genNormalSearch(){
    return Container(
      padding:EdgeInsets.fromLTRB(6, 5, 10, 5),
      child: Row(
        children: <Widget>[
          _wrapTap(
            Container(
              child: widget?.hideLeft??false?null:Icon(
                Icons.arrow_back_ios,
                color:Colors.grey,
                size:26,
              ),
            ),
            widget.leftButtonClick
          ),
          Expanded(
            flex:1,
            child: _inputBox(),
          ),
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text('搜索',
                style: TextStyle(color:Colors.blue,fontSize: 17),
              ),
            ),
            widget.rightButtonClick
          )
        ],
      ),
    );
  }
  // 定义一个widget方法
  _wrapTap(Widget child,void Function() callback){
    return GestureDetector(
      onTap:(){
        if(callback!=null) callback();
      },
      child: child,
    );
  }
  // onChange方法实现
  _onChanged(String text){
    if(text.length>0){
      setState(() {
        showClear=true;
      });
    }else{
      setState(() {
        showClear=false;
      });
    }
    if(widget.onChanged!=null){
      widget.onChanged(text);
    }
  }
  // 判断输入框在首页或者在搜索页的颜色
  _inputBox(){
    Color inputBoxColor;
    if(widget.searchBarType==SearchBarType.home){
      inputBoxColor=Colors.white;
    }else{
      inputBoxColor=Color(int.parse('0xffEDEDED'));
    }
    return Container(
      height:30,
      padding:EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color:inputBoxColor,
        borderRadius: BorderRadius.circular(
          widget.searchBarType==SearchBarType.normal?5:15
        )
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size:20,
            color:widget.searchBarType==SearchBarType.normal?Color(0xffA9A9A9):Colors.blue
          ),
          Expanded(
            flex:1,
            child: widget.searchBarType==SearchBarType.normal?TextField(
              controller: _controller,
              onChanged: _onChanged,
              autofocus: true,
              style: TextStyle(
                fontSize: 18.0,
                color:Colors.black,
                fontWeight: FontWeight.w300
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                border:InputBorder.none,
                hintText: widget.hint??'',
                hintStyle: TextStyle(fontSize: 15)
              ),
            ):_wrapTap(
              Container(
                child: Text(
                  widget.defaultText,
                  style: TextStyle(fontSize: 13,color:Colors.grey),
                ),
              ),
            widget.inputBoxClick
          )),
          // 右边的清空按钮和录音按钮切换
          !showClear?_wrapTap(
            Icon(Icons.mic,size:22,color:widget.searchBarType==SearchBarType.normal?Colors.blue:Colors.grey),
          widget.speakClick):
          _wrapTap(
            Icon(Icons.clear,size:22,color:Colors.grey),
          (){
            setState(() {
              _controller.clear();
            });
            _onChanged('');
          })
        ],
      ),
    );
  }
  // 首页的搜索
  _genHomeSearch(){
    return Container(
      padding:EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: <Widget>[
          _wrapTap(
            Container(
              child: Row(
                children: <Widget>[
                  Text('钦州',style:TextStyle(color:_homeFontColor(),fontSize: 14,)),
                  Icon(Icons.expand_more,color:_homeFontColor(),size:22)
                ],
              )
            ),
            widget.leftButtonClick
          ),
          Expanded(
            flex:1,
            child: _inputBox(),
          ),
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 6, 5),
              child:Icon(Icons.comment,color:_homeFontColor(),size:22)
            ),
            widget.rightButtonClick
          )
        ],
      ),
    );
  }
  // 颜色 
  _homeFontColor(){
    return widget.searchBarType==SearchBarType.home?Colors.white:Colors.grey;
  }
}