import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/http_service.dart';
import '../../models/goodsDetailsModel.dart';
import '../../store/goods_details_store.dart';

class DetailsPage extends StatefulWidget {
  static String tag = 'details_page';
  final String goodsId;
  final String images;
  final String description;
  DetailsPage({this.goodsId, this.images, this.description});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    _getGoodsDetailsData(widget.goodsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getDetails=Provider.of<GoodsDetailsStore>(context).getDetailsData;
    bool flat=Provider.of<GoodsDetailsStore>(context).boolflat;
    return Scaffold(
      appBar: AppBar(title: Text('商品详情')),
      body: Container(
        color: Colors.grey[200],
          child: Column(
        children: <Widget>[
          _shopImage(getDetails,flat),
          _titleIdPrice(getDetails,flat),
          _description(flat)
        ],
      ),),
    );
  }

  // 商品图片
  Widget _shopImage(GoodInfoModel item,bool flat) {
    return Container(
      height: ScreenUtil().setHeight(500),
      color:Colors.white,
      alignment: Alignment.center,
      child: Hero(
        tag: 'hero${widget.goodsId}',
        child: item==null||flat?Image.network(widget.images, fit: BoxFit.fill):Image.network(item.image1, fit: BoxFit.fill),
      ),
    );
  }

  // 商品标题，编号，价格
  Widget _titleIdPrice(GoodInfoModel item,bool flat) {
    if(item==null||flat){
      return Container(
        color:Colors.white,
        padding:EdgeInsets.only(left:20.0,right:20.0),
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Align(
              alignment: FractionalOffset(0, 0),
              child: Container(
                height:ScreenUtil().setHeight(38.0),
                width:ScreenUtil().setWidth(320.0),
                color:Colors.grey[300]
              ),
            ),
            SizedBox(height:ScreenUtil().setHeight(20.0)),
            Align(
              alignment: FractionalOffset(0, 0),
              child: Container(
                height:ScreenUtil().setHeight(30.0),
                width:ScreenUtil().setWidth(260.0),
                color:Colors.grey[200]
              ),
            ),
            SizedBox(height:ScreenUtil().setHeight(20.0)),
            Align(
              alignment: FractionalOffset(0, 0),
              child: Container(
                height:ScreenUtil().setHeight(36.0),
                width:ScreenUtil().setWidth(300.0),
                color:Colors.grey[300]
              ),
            ),
            SizedBox(height:ScreenUtil().setHeight(25.0)),
          ],
        )
      );
    }else{
      return Container(
        padding:EdgeInsets.only(left:20.0,right:20.0),
        color:Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text('${item.goodsName}', style:TextStyle(fontSize: ScreenUtil().setSp(36.0),fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
            ),
            SizedBox(height:ScreenUtil().setHeight(20.0)),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
              '${item.goodsSerialNumber}',
                style: TextStyle(fontSize: ScreenUtil().setSp(26.0), color: Colors.grey[400]),textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height:ScreenUtil().setHeight(20.0)),
            Container(
              child: Row(
                children: <Widget>[
                  Text('¥${item.presentPrice}',style:TextStyle(fontSize: ScreenUtil().setSp(42.0),color:Theme.of(context).primaryColor,fontWeight: FontWeight.w600)),
                  SizedBox(width: 25.0,),
                  Text('市场价：',style:TextStyle(fontSize: ScreenUtil().setSp(32.0),color:Colors.grey[500]),),
                  Text('¥${item.oriPrice}',style:TextStyle(fontSize: ScreenUtil().setSp(28.0),color:Colors.grey[300],decoration: TextDecoration.lineThrough)),
                ],
              ),
            ),
                SizedBox(height:ScreenUtil().setHeight(25.0)),
          ],
        ),
      );
    }
  }
  Widget _description(bool flat){
    return Column(
      children: <Widget>[
        SizedBox(height:ScreenUtil().setHeight(15.0)),
        Container(
          height:ScreenUtil().setHeight(60.0),
          color:Colors.white,
          alignment: Alignment.centerLeft,
          padding:EdgeInsets.only(left:20.0,right:20.0),
          child: flat?Container(
            height:ScreenUtil().setHeight(28),
            color:Colors.grey[200],
            width:ScreenUtil().setWidth(500)
          ):Text('说明：绿色安全 > 急速送达 > 好吃不腻',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: ScreenUtil().setSp(28)),),
        ),
        SizedBox(height:ScreenUtil().setHeight(15.0))
      ],
    );
  }
  Widget _getGoodsDetailsData(String id){
    HttpUtils().get('goodsDetails',data:{
      'goodsId':id
    }).then((res){
      GoodsDetailsModel goodsList=GoodsDetailsModel.fromJson(res);
      Provider.of<GoodsDetailsStore>(context).goodsListDataFuc(goodsList);
    });
  }
}
