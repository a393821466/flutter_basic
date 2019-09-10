import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import '../../utils/fluro_convert_util.dart';
import '../../routers/app_route_init.dart';
import '../../config/http_service.dart';
import '../../models/categoryModel.dart';
import '../../store/classify_store.dart';

// 商品分类的商品列表
class CategoryGoodsList extends StatefulWidget {
  static String tag='category_goods';
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  EasyRefreshController _controller;
  // 底部回弹
  bool _bottomBouncing = true;
  // 开启加载
  bool _enableLoad = true;
  // 开启无限加载
  bool _enableInfiniteLoad = false;
  //
  var scrollContorller = new ScrollController();
  @override
  void initState() {
    _controller = EasyRefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List categoryDataList = Provider.of<ClassifyStore>(context).getCategoryData;
    try {
      // 切换之后
      if (Provider.of<ClassifyStore>(context).page == 1) {
        scrollContorller.jumpTo(0.0);
        _controller.finishLoad(noMore: false);
      }
    } catch (e) {
      print('进入页面第一次初始化${e}');
    }
    if (categoryDataList.length != 0) {
      return Expanded(
        //继承flexible
        child: Container(
            width: ScreenUtil().setWidth(590.0),
            child: EasyRefresh(
              enableControlFinishRefresh: false,
              enableControlFinishLoad: true,
              bottomBouncing: _bottomBouncing,
              controller: _controller,
              footer: ClassicalFooter(
                  enableInfiniteLoad: _enableInfiniteLoad,
                  loadedText: '加载完成',
                  loadText: '松开回弹..',
                  loadReadyText: '松开加载更多..',
                  loadingText: '加载中..',
                  noMoreText: Provider.of<ClassifyStore>(context).getStatus,
                  showInfo: false),
              onLoad: _enableLoad
                  ? () async {
                      int totals =
                          Provider.of<ClassifyStore>(context).getPagesTotao;
                      int pages =
                          Provider.of<ClassifyStore>(context).getPagesIndex;
                      if (pages <= totals) {
                        await _getAddCategory();
                      }
                      Provider.of<ClassifyStore>(context)
                          .changeNoMore('暂无内容..');
                      _controller.finishLoad(noMore: pages == totals);
                      // _controller.finishLoad(noMore: Provider.of<ClassifyStore>(context).getStatus);
                      // await Future.delayed(Duration(seconds: 2), () {
                      //   print('onLoad');
                      //   setState(() {
                      //     _count += 10;
                      //   });
                      // });
                    }
                  : null,
              child: ListView.builder(
                controller: scrollContorller,
                itemCount: categoryDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(categoryDataList, index);
                },
              ),
            )),
      );
    } else {
      return Container(
        child: Text('暂无内容..'),
      );
    }
  }

  // 图片
  Widget _goodsImage(List categoryDataList, int index) {
    return Container(
      width: ScreenUtil().setWidth(240.0),
      padding: EdgeInsets.all(8),
      child:Hero(
        tag: 'hero${categoryDataList[index].goodsId}',
        child: Image.network(categoryDataList[index].images,fit: BoxFit.fill),
      )
    );
  }

  Widget _goodsName(List categoryDataList, int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
      width: ScreenUtil().setWidth(330.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Text(
            categoryDataList[index].goodsName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: ScreenUtil().setSp(28.0)),
          ),
          SizedBox(height: ScreenUtil().setHeight(30.0)),
          Text('￥ ${categoryDataList[index].presentPrice}',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: ScreenUtil().setSp(26.0)),
              textAlign: TextAlign.left),
          Text(
            '￥ ${categoryDataList[index].oriPrice}',
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: ScreenUtil().setSp(24.0)),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _listItem(List categoryDataList, int index) {
    return InkWell(
      onTap: () {
        var str=categoryDataList[index];
        String goodsId=str.goodsId;
        String images=FluroConvertUtils.fluroCnParamsEncode(str.images);
        String description=FluroConvertUtils.fluroCnParamsEncode(str.description);
        AppRouteInit.router.navigateTo(
            context, '/goodsDetail'+'?goodsId=$goodsId&images=$images&description=$description');
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.black12),
            )),
          child: Row(
            children: <Widget>[
              _goodsImage(categoryDataList, index),
              _goodsName(categoryDataList, index),
            ],
          ),
      ),
    );
  }

  void _getAddCategory() {
    Provider.of<ClassifyStore>(context).addPage();
    var data = {
      'categoryId': Provider.of<ClassifyStore>(context).getLeftNavigatorId,
      'categorySubId': '',
      'page': Provider.of<ClassifyStore>(context).getPagesIndex,
      'pageSize': 5
    };
    HttpUtils().get('categoryGoodList', data: data).then((res) {
      var das = res['data']['categoryData'];
      CategoryListModel goodList = CategoryListModel.fromJson(das);
      if (goodList.data == null) {
        Provider.of<ClassifyStore>(context).changeNoMore('暂无内容..');
      } else {
        Provider.of<ClassifyStore>(context).addGoodsList(goodList.data);
      }
    });
  }
}
