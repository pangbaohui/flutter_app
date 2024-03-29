
import 'package:flutter/material.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/widget/webview.dart';

class LocalNav extends StatelessWidget{
  final List<CommonModel> localNavList;

  const LocalNav({Key key,@required this.localNavList}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }
  _items(BuildContext context) {
    if(localNavList == null)return null;
    List<Widget> items=[];
    localNavList.forEach((model){
      items.add(_item(context, model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }
  Widget _item(BuildContext context,CommonModel model){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
            WebView(url:model.url, statusBarColor: model.statusBarColor,hideAppBar: model.hideAppBar,)
          ));
      },
      child: Column(
        children: <Widget>[
          Image.network(model.icon,height: 32,width: 32,),
          Text(model.title,style: TextStyle(fontSize: 10),)
        ],
      ),
    );
  }
}



//组件几要素
//1.继承Widget
//2.有属于自己得构造方法以及入参
//3.重写build方法