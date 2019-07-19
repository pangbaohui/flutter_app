import 'package:flutter/material.dart';
// statelessWidget与基础组件
class StatefulGroup extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}
class _StatefulGroupState extends State<StatefulGroup> {
  // This widget is the root of your application.
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatefulGroup组件',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatefulGroup组件1'),),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.grey,),
            activeIcon: Icon(Icons.home,color: Colors.amber,),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer,color: Colors.grey,),
            activeIcon: Icon(Icons.timer,color: Colors.amber,),
              title: Text('闹钟')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic,color: Colors.grey,),
            activeIcon: Icon(Icons.headset_mic,color: Colors.amber,),
              title: Text('闹钟')
          ),
        ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex==0?
            RefreshIndicator(child:ListView(
              children: <Widget>[Container(
                decoration: BoxDecoration(color: Colors.white),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Image.network(
                      'http://cdn.szpuze.com/FoJEgx3bpgwcAnw695ek1WCuoeRw',
                      width: 200,
                      height: 200,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        hintText: '请输入',
                        hintStyle: TextStyle(fontSize: 20)
                      ),
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(color: Colors.lightBlueAccent),
                      child: PageView(
                        children: <Widget>[
                          _item('第一页', Colors.deepOrange),
                          _item('第二页', Colors.lightGreen),
                          _item('第三页', Colors.limeAccent)
                        ],
                      ),
                    )
                  ],
                ),
              )],
            ),onRefresh: _handleRefresh,)
            :Text('闹钟⏰'),
      ),
    );
  }
  Future<Null> _handleRefresh() async{
    await Future.delayed(Duration(milliseconds: 200));
  }
  _item(String title,Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
