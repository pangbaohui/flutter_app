import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
                      height: 800,
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