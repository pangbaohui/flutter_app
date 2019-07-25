
import 'package:flutter/material.dart';
import 'package:flutter_app/model/grid_nav_model.dart';

class GridNav extends StatelessWidget{
  final GridNavModel gridNavModel;
  final String name;

  const GridNav({Key key,@required this.gridNavModel,this.name = '默认值'}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Text(name);
  }

//StatefulWidget
//  @override
//  _GridNavState createState()=>_GridNavState();
//}
//class _GridNavState extends State<GridNav>{
//  @override
//  Widget build(BuildContext context) {
//    return Text(widget.name);
//  }

}

//组件几要素
//1.继承Widget
//2.有属于自己得构造方法以及入参
//3.重写build方法