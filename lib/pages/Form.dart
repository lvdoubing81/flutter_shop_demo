
import 'package:flutter/material.dart';


class FormPage extends StatefulWidget {
  Map arguments;
  FormPage({Key key, this.arguments}) : super(key: key);  
  @override
  _FormPageState createState() => _FormPageState(arguments:this.arguments);
}

class _FormPageState extends State<FormPage> {
  Map arguments;
  _FormPageState({this.arguments});

  String _username;
  var _password;
  int sex = 1;

  List hobby=[
    {
      "checked":true,
      "title":"吃饭",
    },
    {
      "checked":false,
      "title":"睡觉",
    },
    {
      "checked":true,
      "title":"打豆豆",
    },
    
  ];


  List <Widget> _getHobby(){

      List<Widget> templateList = [];

      for(var i=0;i<this.hobby.length;i++){
          templateList.add(
            Row(
              children: [
                Text(this.hobby[i]["title"]),
                Checkbox(
                  value: this.hobby[i]["checked"],
                  onChanged: (value){
                    setState(() {
                      this.hobby[i]["checked"] = value;
                    });
                  },
                )
              ],
            )
          );
      }

      return templateList;
  }

  void _setSex(value){
    setState(() {
      this.sex = value;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(this.arguments['id']),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        // child: TextDemo(),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '请输入用户名',
                labelText: "用户名",
              ),
              onChanged: (value){
                setState(() {
                  _username = value;
                });
              },
            ),
            SizedBox(height: 20,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '请输入密码',
                labelText: "密码",
              ),
              onChanged: (value){
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('男'),
                Radio(value: 1, groupValue: this.sex, onChanged: _setSex),
              SizedBox(width: 20,),
                Text('女'),
                Radio(value: 2, groupValue: this.sex, onChanged: _setSex),
              ],
            ),
            SizedBox(height: 20,),
            // Text('${this.sex==1?'男':'女'}'),
            // SizedBox(height: 20,),
            Row(
              children: this._getHobby(),
            ),
            SizedBox(height: 20,),
            Container(
              child: RaisedButton(
                child: Text('登录'),
                onPressed: (){
                  print('${this._password}'+'----'+'${this._username}'+'----'+'${this.sex}'+'------'+'${this.hobby}');
                },
              ),
            
            ),
          ],
        ),
      ),
    );
  }
}





// // ignore: must_be_immutable
// class FormPage extends StatelessWidget {
  // String formData;
  // FormPage({this.formData = '表单数据'});


  
//   @override
//   Widget build(BuildContext context) {
//     // final String formData = ModalRoute.of(context).settings.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('表单页面'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         // child: TextDemo(),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: '请输入用户名',
//                 labelText: "用户名",
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class TextDemo extends StatelessWidget {
  const TextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String formData = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Column(
          children: [
            TextField(),
            SizedBox(height: 20,),
            //placeholder
            TextField(
              decoration: InputDecoration(
                hintText: formData
              ),
            ),
            SizedBox(height: 20,),
            //文本框
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: formData
              ),
            ),
            SizedBox(height: 20,),
            //用户名
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "用户名"
              ),
            ),
            SizedBox(height: 20,),
            //密码框
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "密码"
              ),
            ),
          ],
        ),
    );
  }
}