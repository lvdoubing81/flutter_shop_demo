import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:install_plugin/install_plugin.dart';
import '../../utils/dialog_helper.dart';

class DownloadApp extends StatefulWidget {
  DownloadApp({Key key}) : super(key: key);

  @override
  _DownloadAppState createState() => _DownloadAppState();
}

class _DownloadAppState extends State<DownloadApp> {
  Future _future;
  String _flatform;
  Map _appInfo = {
    "app_name": "com.sycfgroup.android.mis",
    "platform": "android"
  };
  String _progress = '';

  _getAppInfo() {
    if (Platform.isAndroid) {
      _flatform = 'android';
    } else {
      _flatform = 'ios';
    }
  }

  Future<File> downloadAndroid() async {
    Directory storageDir = await getExternalStorageDirectory();
    String storagePath = storageDir.path;
    print(storagePath);
    File file = new File('$storagePath/测试下载.apk');

    if (!file.existsSync()) {
      file.createSync();
    }

    try {
       print("-------------download");
      Response response = await Dio()
          .get("http://192.168.15.1023:8001/test/file",   //storagePath,
          onReceiveProgress: (num count, num total) {
            print(count);
            double countKb = count / 1024;
            double totalKb = total / 1024;
            if (mounted) {
              setState(() {
                _progress =
                    "${countKb.toStringAsFixed(1)} of 37519.36 KB，\n${(count / 38419019 * 100).toStringAsFixed(1)}%";
              });
            }
          },
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
          ));
      file.writeAsBytesSync(response.data);
      print('下载成功');
      return file;
    } catch (e) {
      print(e);
      print('下载失败');
      throw e;
    }
  }

  Future<File> downloadAndroid12() async {
    Directory storageDir = await getExternalStorageDirectory();
    String storagePath = storageDir.path;
    print(storagePath);
    File file = new File('$storagePath/测试下载.apk');

    if (!file.existsSync()) {
      file.createSync();
    }

    try {
       print("-------------download");
      Response response = await Dio()
          .get("http://192.168.15.103:8001/test/file",   //storagePath,
          onReceiveProgress: (num count, num total) {
            print(count);
            double countKb = count / 1024;
            double totalKb = total / 1024;
            if (mounted) {
              setState(() {
                _progress =
                    "${countKb.toStringAsFixed(1)} of 37519.36 KB，\n${(count / 38419019 * 100).toStringAsFixed(1)}%";
              });
            }
          },
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
          ));
      file.writeAsBytesSync(response.data);
      print('下载成功');
      return file;
    } catch (e) {
      print(e);
      print('下载失败');
      throw e;
    }
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }



  // 安装apk
Future<Null> installApk() async {
  // File _apkFile = await downloadAndroid();
  // String _apkFilePath = _apkFile.path;
  Directory storageDir = await getExternalStorageDirectory();
    String _apkFilePath = storageDir.path + '/installTest.apk';
    print(_apkFilePath);

  if (_apkFilePath.isEmpty) {
    print('make sure the apk file is set');
    return;
  }

  InstallPlugin.installApk(_apkFilePath, 'com.example.flutterappdemo1')
      .then((result) {
    print('install apk $result');
  }).catchError((error) {
    print('install apk error: $error');
  });
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = downloadAndroid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('下载更新'),
        ),
        body: _buildContent()
        );
  }

Widget _buildContent(){
  print("=== buildContent() of download_app ");
    var featureBuilder = FutureBuilder<File>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return Center(child:Text('加载中'));
            break;
          case ConnectionState.active:
          case ConnectionState.waiting:
            return  _buildLoadingPage();
            break;
          case ConnectionState.done:
            if (snapshot.hasError){
              return Center(child: Container(
                height: 100,
                child: Column(
                  children: [
                    Text('下载失败，请重试'),
                    SizedBox(
                      height: 12,
                    ),
                    RaisedButton(
                      onPressed: (){
                        try{
                          _future = downloadAndroid12();
                          setState(() {});
                        } on Exception catch (e){
                          DialogHelper.of(context).error(e.toString());
                        }
                      },
                      child:Text('重新下载'),
                    )
                  ],
                ),
              ));
            }else{
              return _buildResultPage();
            }
            break;
        }
      },
    );
    return featureBuilder;
}

Widget _buildLoadingPage(){
  return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_progress,
              textAlign: TextAlign.center,
              // style: TextStyle(color: AppColors.themeColor),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("正在下载App ...",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
}

Widget _buildResultPage(){
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 40.0),
            child: Text("升级包下载成功！"),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: SizedBox(width: 120.0, child: Text("安装", textAlign: TextAlign.center,)),
              onPressed: (){
                try {
                  installApk();
//                Future.delayed(Duration(seconds: 10), (){
//                  App.exitApp();
//                });
                } on Exception catch (e){
                  DialogHelper.of(context).error(e.toString());
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: SizedBox(width: 120.0, child: Text("重新下载", textAlign: TextAlign.center,)),
              onPressed: (){
                try {
                  downloadAndroid();
                  setState((){});
                } on Exception catch (e){
                  DialogHelper.of(context).error(e.toString());
                }
              },
            ),
          ),
        ],
      ),
    );
}

}


