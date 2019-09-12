import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/http_service.dart';
import '../../models/goodsDetailsModel.dart';
import '../../store/goods_details_store.dart';
import '../../components/goodsDetails/goods_detail_img.dart';
import '../../components/goodsDetails/goods_price.dart';
import '../../components/goodsDetails/goods_description.dart';
import '../../components/goodsDetails/goods_comments.dart';
import '../../components/goodsDetails/goods_buy_car.dart';

class DetailsPage extends StatefulWidget {
  static String tag = 'details_page';
  final String goodsId;
  final String images;
  DetailsPage({this.goodsId, this.images});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double _alphaAppBar = 0;
  var scrollContorller = new ScrollController();

  @override
  void initState() {
    _getGoodsDetailsData(widget.goodsId);
    super.initState();
  }

  _onScroll(offset) {
    double alpha = offset / 1000;
    setState(() {
      _alphaAppBar = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    var getDetails = Provider.of<GoodsDetailsStore>(context).getDetailsData;
    bool flat = Provider.of<GoodsDetailsStore>(context).boolflat;
    return Scaffold(
      appBar: AppBar(title: Text('商品详情')),
      body: Container(
        color: Colors.grey[200],
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (ScrollNotification) {
                  print(ScrollNotification);
                  if (ScrollNotification is ScrollUpdateNotification &&
                      ScrollNotification.depth == 0) {
                    _onScroll(ScrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  controller: scrollContorller,
                  children: <Widget>[
                    GoodsDetailImg(
                        widget.goodsId, widget.images, getDetails, flat),
                    GoodsPrice(getDetails, flat),
                    GoodsDescrition(flat),
                    GoodsComments()
                  ],
                ),
              ),
            ),
            GoodsBuyCar(),
            Positioned(
              right: ScreenUtil().setSp(20),
              bottom: ScreenUtil().setSp(130),
              child: AnimatedOpacity(
                  opacity: _alphaAppBar >= 1 ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Offstage(
                    offstage: _alphaAppBar >= 0.5 ? false : true,
                    child: InkWell(
                      onTap: () {
                        scrollContorller.jumpTo(0.0);
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(80.0),
                        height: ScreenUtil().setHeight(80.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            color: Color.fromRGBO(0, 0, 0, 0.6)),
                        child: Icon(Icons.keyboard_arrow_up,
                            size: 32, color: Colors.grey[200]),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  _getGoodsDetailsData(String id) async {
    await HttpUtils().get('goodsDetails', data: {'goodsId': id}).then((res) {
      GoodsDetailsModel goodsList = GoodsDetailsModel.fromJson(res);
      Provider.of<GoodsDetailsStore>(context).goodsListDataFuc(goodsList);
    });
  }
}
