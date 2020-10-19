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


//自定义有状态组件
class HomeContent extends StatefulWidget {
 HomeContent({Key key}) : super(key: key);

  @override
   HomeContentState createState() =>  HomeContentState();
}

class  HomeContentState extends State <HomeContent> {
  int countNum = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,),
        Text('${this.countNum}'),
        SizedBox(height: 20,),
        RaisedButton(
          child: Text('按钮'),
          onPressed: (){
            setState(() {
              this.countNum++;
            });
            print('点击按钮了');
          },
        )
      ],
    );
  }
}















// class HomeContent extends StatelessWidget {  //无状态组件，不能改变里面的数据
//   int countNum = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 200,),
//         Text('hello'),
//         SizedBox(height: 20,),
//         RaisedButton(
//           child: Text('${this.countNum}'),
//           onPressed: (){
//             this.countNum++;
//             print(this.countNum);
//           },
//         ),
//       ],
//     );
//   }
// }

