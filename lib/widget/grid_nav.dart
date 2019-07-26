import 'package:flutter/material.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/widget/webview.dart';

class GridNav extends StatelessWidget{
  final GridNavModel gridNavModel;

  const GridNav({Key key, this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: _gridNavItems(context),
    );
  }
  _gridNavItems(BuildContext context){
    List<Widget> items = [];
    if(gridNavModel == null)return items;
    if(gridNavModel.hotel != null){
    }
    if(gridNavModel.flight != null){}
    if(gridNavModel.travel != null){}
  }
  gridNavItem(BuildContext context,GridNavItem gridNavItem,bool first){
    List<Widget> items=[];
    items.add(_mainItem(context, gridNavItem.mainItem));
  }
  _mainItem(BuildContext context,CommonModel model){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebView(
              url:model.url,
              title: model.title,
              statusBarColor: model.statusBarColor,
              hideAppBar: model.hideAppBar,
            )));
      },
      child: Stack(
        children: <Widget>[
          Image.network(model.icon,fit: BoxFit.contain,
            height: 88,width: 120,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Text(model.title,style: TextStyle(fontSize: 14,color: Colors.white),)
        ],
      ),
    );
  }
  _doubleItem(BuildContext context, CommonModel topItem, CommonModel bottomItem,bool isCenterItem){
    return Column(
      children: <Widget>[
        Expanded(child: _item,)
      ],
    );
  }
  _item(BuildContext context, CommonModel item,bool first,bool isCenterItem){
    BorderSide borderSide = BorderSide(width: 0.8,color: Colors.white);
    return FractionallySizedBox(
      //撑满父布局的宽度
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: borderSide,
              bottom: first?borderSide:BorderSide.none)
        ),
        child: Center(
          child: Text(item.title,textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14,color: Colors.white),),
        ),
      ),
    );
  }
  _wrapGesture(BuildContext context,Widget widget,CommonModel model){
    return GestureDetector(
      onTap:() {
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>
          WebView(
            url: model.url,
            statusBarColor: model.statusBarColor,
            title: model.title,
            hideAppBar: model.hideAppBar,
          )
        ));
      },
      child: widget,
    );
  }
}

//class GridNav extends StatelessWidget{
//  final GridNavModel gridNavModel;
//  final String name;
//
//  const GridNav({Key key,@required this.gridNavModel,this.name = '默认值'}) : super(key: key);
//  @override
//  Widget build(BuildContext context){
//    return Text(name);
//  }

//StatefulWidget
//  @override
//  _GridNavState createState()=>_GridNavState();
//}
//class _GridNavState extends State<GridNav>{
//  @override
//  Widget build(BuildContext context) {
//    return Text(widget.name);
//  }

//}

//组件几要素
//1.继承Widget
//2.有属于自己得构造方法以及入参
//3.重写build方法