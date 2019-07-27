import 'package:flutter/material.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/widget/webview.dart';

class GridNav extends StatelessWidget{
  final GridNavModel gridNavModel;

  const GridNav({Key key, this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return PhysicalModel(
      //把圆角层作为上层
      color: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      //是否裁切
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }
  _gridNavItems(BuildContext context){
    List<Widget> items = [];
    if(gridNavModel == null)return items;
    if(gridNavModel.hotel != null){
      items.add(_gridNavItem(context,gridNavModel.hotel,true));
    }
    if(gridNavModel.flight != null){
      items.add(_gridNavItem(context,gridNavModel.flight,true));
    }
    if(gridNavModel.travel != null){
      items.add(_gridNavItem(context,gridNavModel.travel,true));
    }
    return items;
  }
  _gridNavItem(BuildContext context,GridNavItem gridNavItem,bool first){
    List<Widget> items=[];
    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2));
    items.add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4));
    List<Widget> exandItems =[];
      items.forEach((item){
        exandItems.add(Expanded(child:item,flex:1));
      });
      Color startColor = Color(int.parse('0xff'+gridNavItem.startColor));
      Color endColor = Color(int.parse('0xff'+gridNavItem.endColor));

    return Container(
      height: 88,
      margin: first?null:EdgeInsets.only(top: 3),

      decoration: BoxDecoration(
        //线性渐变
        border: Border(bottom:BorderSide(width: 2,color: Colors.white)),
        gradient: LinearGradient(colors: [startColor,endColor])
      ),
      child: Row(children:exandItems,),
    );
  }
  _mainItem(BuildContext context,CommonModel model){
    return _wrapGesture(context, Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Image.network(model.icon,fit: BoxFit.contain,
          height: 88,width: 120,
          alignment: AlignmentDirectional.bottomEnd,

        ),
        Container(
          margin: EdgeInsets.only(top: 11),
          child: Text(model.title,style: TextStyle(fontSize: 14,color: Colors.white),),
        )
      ],
    ), model);
  }
  _doubleItem(BuildContext context, CommonModel topItem, CommonModel bottomItem){
    return Column(
      children: <Widget>[
        //垂直方向展开
        Expanded(child: _item(context, topItem, true),),
        Expanded(child: _item(context, bottomItem, false),)
      ],
    );
  }
  _item(BuildContext context, CommonModel item,bool first){
    BorderSide borderSide = BorderSide(width: 0.8,color: Colors.white);
    return FractionallySizedBox(
      //FractionallySizedBox撑满父布局的宽度，水平方向展开
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              left: borderSide,
              bottom: first?borderSide:BorderSide.none
          )
        ),
        child: _wrapGesture(context, Center(
          child: Text(item.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14,color: Colors.white),
        ),), item)
    ));
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