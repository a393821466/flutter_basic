class Posts {
  const Posts({this.title, this.author, this.imgUrl});
  final String title;
  final String author;
  final String imgUrl;
  final bool selected = false;
}

final List<Posts> posts = [
  Posts(
    title: '诛仙',
    author: '萧鼎',
    imgUrl: 'images/banner1.jpg',
  ),
  Posts(
    title: '网游之古剑太初',
    author: '不古',
    imgUrl: 'images/banner2.jpg',
  ),
  Posts(
    title: '学园禁区',
    author: '青子',
    imgUrl: 'images/banner3.jpg',
  ),
  Posts(
    title: '男生女生',
    author: '杂志',
    imgUrl: 'images/banner4.jpg',
  ),
  Posts(title: '送葬人', author: '颜祯', imgUrl: 'images/banner5.jpg')
];
