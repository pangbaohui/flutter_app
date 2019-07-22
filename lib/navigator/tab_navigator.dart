import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/messge_page.dart';
import 'package:flutter_app/pages/my_page.dart';

class TabNavigator extends StatefulWidget{
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}
class _TabNavigatorState extends State<TabNavigator>{
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.lime;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage:0,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          MessgePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem('首页', Icons.home, 0),
            _bottomItem('消息', Icons.message, 1),
            _bottomItem('我的', Icons.account_circle, 2),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.home,color: _defaultColor,),
//                activeIcon: Icon(Icons.home,color: _activeColor,),
//                title: Text('首页',style: TextStyle(color: _currentIndex != 0 ? _defaultColor:_activeColor),)
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.message,color: _defaultColor,),
//                activeIcon: Icon(Icons.message,color: _activeColor,),
//                title: Text('消息',style: TextStyle(color: _currentIndex != 1 ? _defaultColor:_activeColor),)
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.account_circle,color: _defaultColor,),
//                activeIcon: Icon(Icons.account_circle,color: _activeColor,),
//                title: Text('我的',style: TextStyle(color: _currentIndex != 2 ? _defaultColor:_activeColor),)
//            ),
          ]
      ),
    );
  }


  _bottomItem(String title,IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon,color: _defaultColor,),
        activeIcon: Icon(icon,color: _activeColor,),
        title: Text(title,style: TextStyle(color: _currentIndex != index ? _defaultColor:_activeColor)
        ));
  }
}