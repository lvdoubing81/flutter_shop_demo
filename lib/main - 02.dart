import 'package:flutter/material.dart';
import 'res/listData.dart';

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
    
    return ListView(
      children: listData.map((value){
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(value['imageUrl'],fit: BoxFit.cover,),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(value['imageUrl'],fit: BoxFit.cover,height: 60,width: 60,),
                ),
                title: Text(value['author']),
                subtitle: Text(value['description'],overflow: TextOverflow.ellipsis,),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

}

