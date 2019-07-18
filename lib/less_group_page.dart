import 'package:flutter/material.dart';
import "package:flutter_color_plugin/flutter_color_plugin.dart";
// statelessWidget与基础组件
class LessGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWidget组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatelessWidget组件1'),),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('StatelessWidget组件2',style: textStyle,),
              Icon(Icons.android,size: 50,color: Colors.green,),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                  label: Text('chip小部件',style: textStyle,)
              ),
              Divider(
                height: 50,
                color: Colors.amber,
              ),
              Card(
                //带有圆角阴影边框的特效卡片
                color: Colors.green,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('子容器',style: textStyle,),
                ),
              ),
              AlertDialog(
                title: Text('提示弹框'),
                content: Text('提示内容'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
