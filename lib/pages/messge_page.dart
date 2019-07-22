import 'package:flutter/material.dart';

class MessgePage extends StatefulWidget{
  @override
  _MessgePageState createState() => _MessgePageState();
}
class _MessgePageState extends State<MessgePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('消息',style: TextStyle(color: Colors.lightGreen),),
        )
    );
  }
}