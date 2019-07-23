import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_app/plugin_use.dart';
import 'package:flutter_app/statefull_group_page.dart';

import 'less_group_page.dart';
import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: TabNavigator(),
//    );
//  }
//}
class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  String showResult = '';
  Future<CommonModel> fetchPost() async{
    final response = await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = convert.json.decode(response.body);
    return CommonModel.fromJson(result);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('http'),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                fetchPost().then((CommonModel value){
                  setState(() {
                    showResult = '请求结果：\n hideAppBar: ${value.hideAppBar}\n icon:${value.icon}';
                  });
                });
              },
              child: Text('点我',style: TextStyle(color: Colors.grey[800],fontSize: 26),),
            ),
            Text(showResult)
          ],
        ),
      ),
    );
  }
}

class CommonModel{
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});
  factory CommonModel.fromJson(Map<String,dynamic>json){
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}
