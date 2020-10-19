import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowNewApp extends StatefulWidget {
  Map arguments;
  ShowNewApp({
    Key key,
    this.arguments,
  }) : super(key: key);

  @override
  _ShowNewAppState createState() => _ShowNewAppState(arguments: this.arguments);
}

class _ShowNewAppState extends State<ShowNewApp> {
  Map arguments;
  _ShowNewAppState({this.arguments});

  //退出
  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  //跳过
  void skip() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('skip_version', arguments['version_code']);
    print('已经跳过的版本为----' + sharedPreferences.getInt('skip_version').toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('新数据' + this.arguments.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('发现新版本！'),
        ),
        body: WillPopScope(
          onWillPop: null,
          child: Stack(children: [
            ListView(
              children: [
                ListTile(
                  title: Text("当前版本: ${this.arguments['_version']}"),
                ),
                ListTile(
                  title: Text("新版本号: ${this.arguments['version_name']}"),
                ),
                ListTile(
                  title: Text(
                      "发布时间: ${this.arguments['release_date'].toString().replaceRange(10, 23, '')}"),
                ),
                Divider(),
                ListTile(
                  title: Text("新增功能: ${this.arguments['features']}"),
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 70,
                  height: 186,
                  child: ListView(
                    children: [
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(bottom: 12),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/download_app');
                          },
                          child: Text('升级'),
                        ),
                      ),
                      arguments['isSkip']
                          ? Text('')
                          : Container(
                              height: 50,
                              margin: EdgeInsets.only(bottom: 12),
                              child: RaisedButton(
                                onPressed: () async {
                                  skip();
                                },
                                child: Text('跳过'),
                              ),
                            ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(bottom: 12),
                        child: RaisedButton(
                          onPressed: () async {
                            await pop();
                          },
                          child: Text('退出'),
                        ),
                      ),
                    ],
                  ),
                ))
          ]),
        ));
  }
}
