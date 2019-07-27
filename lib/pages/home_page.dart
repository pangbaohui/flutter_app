import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/dao/home_dao.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/model/home_model.dart';
import 'package:flutter_app/model/sales_box_model.dart';
import 'package:flutter_app/widget/local_nav.dart';
import 'package:flutter_app/widget/sales_box.dart';
import 'package:flutter_app/widget/sub_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/widget/grid_nav.dart';

const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
//  List<Widget> imageList = List();
//  @override
//  void initState() {
//    imageList
//      ..add(Image.network(
//        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
//        fit: BoxFit.fill,
//      ))
//      ..add(Image.network(
//        'https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg',
//        fit: BoxFit.fill,
//      ))
//      ..add(Image.network(
//        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
//        fit: BoxFit.fill,
//      ))
//      ..add(Image.network(
//        'https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg',
//        fit: BoxFit.fill,
//      ));
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        backgroundColor: Colors.black12,
//        appBar: AppBar(title: Text('轮播图'),),
//        body: ListView(     // 这里使用listView是因为本地写了几组不同样式的展示，太懒了，所以这里就没有改
//          children: <Widget>[
//            firstSwiperView()
//          ],
//        )
//    );
//  }
//
//  Widget firstSwiperView() {
//    return Container(
//      padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
//      width: MediaQuery.of(context).size.width,
//      height: 300,
//      child: Swiper(
//        itemCount: 4,
//        itemBuilder: _swiperBuilder,
//        pagination: SwiperPagination(
//            alignment: Alignment.bottomRight,
//            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
//            builder: DotSwiperPaginationBuilder(
//                color: Colors.black54,
//                activeColor: Colors.white
//            )
//        ),
//        controller: SwiperController(),
//        scrollDirection: Axis.horizontal,
//        autoplay: true,
//        onTap: (index) => print('点击了第$index'),
//      ),
//    );
//  }
//
//  Widget _swiperBuilder(BuildContext context, int index) {
//    return (imageList[index]);
//  }

  List _imageUrls = [
    'https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
    'https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg'
  ];
  double appBarAlpha = 0;
  String resultString = "";
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;
  @override
  void initState(){
    super.initState();
    loadData();
  }
  _onScroll(offset){
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if(alpha < 0){
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }
  loadData() async{
//    HomeDao.fetch().then((res){
//      setState(() {
//        resultString = json.encode(res);
//      });
//    }).catchError((e){
//      setState(() {
//        resultString = e.toString();
//      });
//    });
  try{
    HomeModel model = await HomeDao.fetch();
    setState(() {
//      resultString = json.encode(model.bannerList[0].icon);
      localNavList = model.localNavList;
      subNavList = model.subNavList;
      gridNavModel = model.gridNav;
      salesBoxModel = model.salesBox;
    });
  }catch(e){
    print(e);
//    setState(() {
//      resultString = e.toString();
//    });
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollNotifiction){
                  if(scrollNotifiction is ScrollUpdateNotification &&
                      scrollNotifiction.depth == 0){
                    _onScroll(scrollNotifiction.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index){
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 7),
                      child:LocalNav(localNavList:localNavList),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 7),
                      child:GridNav(gridNavModel: gridNavModel),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 7),
                      child:SubNav(subNavList: subNavList),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 7),
                      child:SalesBox(salesBox: salesBoxModel),
                    ),

                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffff4e63),Color(0xffff6cc9),],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight
                          )
                      ),
                      child: ListTile(title: Text(resultString),),
                    )
                  ],
                ),
              )

          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Text('首页'),
              ),
            ),
          )
        ],
      )
    );
  }
}