import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_app/plugin_use.dart';
import 'package:flutter_app/statefull_group_page.dart';

import 'less_group_page.dart';
import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
    );
  }
}
//class MyApp extends StatefulWidget {
//  @override
//  _State createState() => _State();
//}

//class _State extends State<MyApp> {

  //网络请求
//  String showResult = '';
//  Future<CommonModel> fetchPost() async{
//    final response = await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
//    convert.Utf8Decoder utf8decoder = convert.Utf8Decoder();//中文乱码
//    final result = convert.json.decode(utf8decoder.convert(response.bodyBytes));
//    return CommonModel.fromJson(result);
//  }


//
//  String countString = '';
//  String localCount = '';
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('future与futureBuilder'),
//        ),
//        body:Column(children: <Widget>[
//          RaisedButton(
//            onPressed: _incrementCounter,
//            child: Text('increment count'),
//          ),
//          RaisedButton(
//            onPressed: _getCounter,
//            child: Text('get count'),
//          ),
//          Text(
//            countString,
//            style: TextStyle(fontSize: 20),
//          ),
//          Text(
//            localCount,
//            style: TextStyle(fontSize: 20),
//          )
//        ],)




//        FutureBuilder<CommonModel>(
//         future: fetchPost(),
//         builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot){
//          switch(snapshot.connectionState){
//          //检查网络连接状态
//            case ConnectionState.none:
//              return  Text('input a url to start');
//            case ConnectionState.waiting:
//              return  Center(child: CircularProgressIndicator(),);
//            case ConnectionState.active:
//              return  new Text('激活状态');
//            case ConnectionState.done:
//              if(snapshot.hasError){
//                return new Text('${snapshot.error}',style: TextStyle(color: Colors.red),);
//              }else{
//                return new Column(children: <Widget>[
//                  Text('返回数据'),
//                  Text('icon${snapshot.data.icon}'),
//                  Text('title${snapshot.data.title}'),
//                  Text('url${snapshot.data.url}'),
//                  Text('statusBarColor${snapshot.data.statusBarColor}'),
//                  Text('hideAppBar${snapshot.data.hideAppBar}'),
//                ],);
//              }
//          }
//
//        })




//        Column(
//          children: <Widget>[
//            InkWell(
//              onTap: (){
//                fetchPost().then((CommonModel value){
//                  setState(() {
//                    showResult = '请求结果：\n hideAppBar: ${value.hideAppBar}\n icon:${value.icon}';
//                  });
//                });
//              },
//              child: Text('点我',style: TextStyle(color: Colors.grey[800],fontSize: 26),),
//            ),
//            Text(showResult)
//          ],
//        ),



//      ),
//    );
//  }
//  _incrementCounter() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    setState(() {
//      countString = countString + "1";
//    });
//    int counter = (prefs.getInt('counter') ?? 0) + 1;
//    await prefs.setInt('counter',counter);
//  }
//  _getCounter() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    setState(() {
//      localCount = prefs.getInt('counter').toString();
//    });
//  }
//}

//class CommonModel{
//  final String icon;
//  final String title;
//  final String url;
//  final String statusBarColor;
//  final bool hideAppBar;
//
//  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});
//  factory CommonModel.fromJson(Map<String,dynamic>json){
//    return CommonModel(
//      icon: json['icon'],
//      title: json['title'],
//      url: json['url'],
//      statusBarColor: json['statusBarColor'],
//      hideAppBar: json['hideAppBar'],
//    );
//  }
//}
