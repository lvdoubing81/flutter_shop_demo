//欢迎页面
//检查包更新
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import '../dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Map _appInfo = {
    "app_name": "com.sycfgroup.android.mis",
    "platform": "android"
  };
  String _version;
  int _version_code;
  int skip_version;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
     _getAppInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
            width: 100,
            height: 100,
        child: ListView(
          children: [
            RaisedButton(
              // onPressed: () => _getAppInfo(),
              onPressed: () => print("更新"),
              child: Text('欢迎使用'),
            ),
            RaisedButton(
              onPressed: () => _removeSkip(),
              child: Text('清除缓存'),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _getAppInfo() async {
    await Future.delayed(Duration(seconds: 2));
    //获取本机信息
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
    _version_code = int.parse(packageInfo.buildNumber);
    print(packageInfo.packageName + '--' + packageInfo.appName);
    // print(Platform);
    if(Platform.isAndroid){
      print('我是安卓机');
    }

    //获取服务器信息
    var res = await DioUtiles.request(
      '/app/Version',
      parameters: _appInfo,
      method: 'post',
    );
    res['_version'] = _version;
    if (_version_code < res['version_code']) {
      print('有新版本');
      await _getSkip();
      if (skip_version == res['version_code']) {
        res['isSkip'] = true;
        // return Navigator.of(context).pushNamed('/');
      }else{
        res['isSkip'] = false;
      }
      Navigator.of(context).pushNamed('/showNewApp', arguments: res);
    }
  }

  _getSkip() async {
    SharedPreferences shared_preferences =await SharedPreferences.getInstance();
    skip_version = shared_preferences.getInt('skip_version')?? -1;
  }

  _removeSkip() async {
    SharedPreferences shared_preferences =await SharedPreferences.getInstance();
    shared_preferences.remove('skip_version');
    print('已经清除跳过版本的数据');
  }
}
