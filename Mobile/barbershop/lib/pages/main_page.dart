import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search), 
          onPressed: (){}),
        ],),
        body: Container(),
    );
  }
}