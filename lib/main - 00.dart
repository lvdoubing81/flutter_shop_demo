import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '首页',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('首页'),
          
        ),
        body: HomeContent()
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('你好啊'),
    );
  }

}

