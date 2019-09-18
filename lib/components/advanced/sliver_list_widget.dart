import 'package:flutter/material.dart';
class Posts {
  final String title;
  final String author;
  final String imgUrl;
  final String des;
  const Posts({this.title, this.author, this.imgUrl,this.des});
}

final List<Posts> posts = [
  Posts(title: '诛仙', author: '萧鼎', imgUrl: 'images/banner1.jpg',des:'阿娇深刻的健康撒娇的卡'),
  Posts(title: '网游之古剑太初', author: '不古', imgUrl: 'images/banner2.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '男生女生', author: '杂志', imgUrl: 'images/banner4.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '送葬人', author: '颜祯', imgUrl: 'images/banner5.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '诛仙', author: '萧鼎', imgUrl: 'images/banner1.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '网游之古剑太初', author: '不古', imgUrl: 'images/banner2.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '学园禁区', author: '青子', imgUrl: 'images/banner3.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '男生女生', author: '杂志', imgUrl: 'images/banner4.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '送葬人', author: '颜祯', imgUrl: 'images/banner5.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '诛仙', author: '萧鼎', imgUrl: 'images/banner1.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '网游之古剑太初', author: '不古', imgUrl: 'images/banner2.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '学园禁区', author: '青子', imgUrl: 'images/banner3.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '男生女生', author: '杂志', imgUrl: 'images/banner4.jpg',des:'阿娇深刻的健康撒娇的卡',),
  Posts(title: '送葬人', author: '颜祯', imgUrl: 'images/banner5.jpg',des:'阿娇深刻的健康撒娇的卡')
];

class SliverListBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title:Text('视口列表'),
            // pinned: true, //固定在头部
            floating: true,
            expandedHeight: 178,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('GOOD IMAGES'.toUpperCase(),style: TextStyle(
                fontSize:15.0,
                letterSpacing: 3.0,
                fontWeight: FontWeight.w400
              ),),
              background: Image.asset(
                'images/bg.png',
                fit:BoxFit.cover
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding:EdgeInsets.all(6),
              sliver: MediaQuery.removePadding(
                removeTop: true,
                 context: context,
                child: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                      return Padding(
                        padding:EdgeInsets.only(bottom:3),
                        child:Container(
                          margin:EdgeInsets.fromLTRB(0, 10, 0, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow:[
                              BoxShadow(offset: Offset(1, 4),
                              color:Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 8,
                              spreadRadius: 3
                              )
                            ]
                          ),
                          child: Stack(
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 16/9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(posts[index].imgUrl,fit:BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                top:32.0,
                                left:32.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width:120,
                                      alignment: Alignment.center,
                                      padding:EdgeInsets.all(5),
                                      color:Colors.black45,
                                      child: Text('${posts[index].title}',style: TextStyle(fontSize:14,color:Colors.white)),
                                    ),
                                    Container(
                                      width:120,
                                      alignment: Alignment.center,
                                      padding:EdgeInsets.all(5),
                                      color:Colors.black45,
                                      child:Text('${posts[index].author}',style: TextStyle(fontSize:12,color:Colors.white))
                                    )
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color:Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.white.withOpacity(0.3),
                                    highlightColor: Colors.white.withOpacity(0.1),
                                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SliverSubPage(posts:posts[index]))),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      );
                    },
                    childCount: posts.length
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}


// 子路由
class SliverSubPage extends StatelessWidget {
  final Posts posts;
  SliverSubPage({Key key,@required this.posts}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${posts.title}'),
      ),
      body:Column(
        children: <Widget>[
          Image.asset('${posts.imgUrl}',fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(32),
            width:double.infinity,
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${posts.title}',style:Theme.of(context).textTheme.title),
                Text('${posts.author}',style:Theme.of(context).textTheme.subhead),
                SizedBox(height:36),
                Text('${posts.des}',style:Theme.of(context).textTheme.body1)
              ],
            ),
          )
        ],
      )
    );
  }
}