import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toast/toast.dart';
import '../dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  var url = "/token";
  var form = {
    "username": "fxj",
    "password": "123456",
    "client_ip": "string",
    "device": "string",
    "client_app": "string",
    "extra_msg": "string"
  };
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: duration,
        gravity: gravity,
        backgroundColor: Colors.white,
        textColor: Colors.green,
        border: Border.all(width: 1, color: Color.fromRGBO(100, 100, 100, .2)),
        backgroundRadius: 10);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setToken();
  }
  void setToken() async{
    var token = "i am superman";
    //初始化类
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
    print('存储了数据');
    // var aaa = pref.getString(token);
    // print('我是获取的数据-----------'+aaa);

  }
  String bbb = '123';
  void getToken()async{
    //初始化类
    SharedPreferences pref = await SharedPreferences.getInstance();
    var ccc = pref.getString("token") ?? '123';
    setState(() {
      bbb = ccc;
    });
    print(ccc);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试页面'),
        ),
        body: Center(
            child: Container(

                // color: Colors.blue,
                decoration: BoxDecoration(
                    border: Border.all(width: 10, color: Colors.blue)),
                // foregroundDecoration: BoxDecoration(
                //   border: Border.all(width:1,color:Colors.red),
                //   color: Colors.yellow
                // ),
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    RaisedButton(
                        child: Text('测试toast'), onPressed: () => showToast("登录成功")),
                    RaisedButton(
                        child: Text('测试网络请求'),
                        onPressed: () {
                          DioUtiles.request(url,
                              parameters: form,
                              method: "POST",
                              onSuccess: (data) {
                            print(data["token"]);
                          });
                        }),
                      RaisedButton(
                        child: Text('测试缓存'),
                        onPressed: (){
                            getToken();
                        },
                      ),
                      Text(bbb),
                  ],
                ))));
  }
}
