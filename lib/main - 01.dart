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

class HomeContent extends StatelessWidget{

  List <Widget> _getListData(){
    List<Widget> list = new List();

    for(var i=0;i<10;i++){
      list.add(Container(
        
        alignment: Alignment.center,
        child:Text('这是第$i条数据哦'),
        color: Colors.blue,
      ));
      }
      return list;
  }
    
  @override
  Widget build(BuildContext context) {

    return GridView.count(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      padding: EdgeInsets.all(10),
      crossAxisCount: 3,
      children: this._getListData(),
      );
  }

}