

import 'package:flutter/material.dart';
import 'package:com.sycfgroup.android.mis/utils/event_bus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:toast/toast.dart';
// import 'package:event_bus/event_bus.dart';
import 'package:package_info/package_info.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';



import '../../utils/sound_helper.dart';


class TestDeviceInfo extends StatefulWidget {
  TestDeviceInfo({Key key}) : super(key: key);

  @override
  _TestDeviceInfoState createState() => _TestDeviceInfoState();
}

class _TestDeviceInfoState extends State<TestDeviceInfo> {
  
  var _imgPath;
  String content = '';
  _scan() async {
    var options = ScanOptions();
    ScanResult result = await BarcodeScanner.scan(options: options);
    print(result.rawContent);
    setState(() {
      content = result.rawContent;
      print(content);
      showToast("提交成功");
    });
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: duration,
        gravity: gravity,
        backgroundColor: Colors.white,
        textColor: Colors.green,
        border: Border.all(width: 1, color: Color.fromRGBO(100, 100, 100, .2)),
        backgroundRadius: 10);
  }

  void showDeviceInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    print('应用名称'+appName+'--打包名称--'+packageName+'--版本号--'+version+'--打包次数--'+buildNumber);
    

  }


  _alertDialog(){
    showDialog(
      context: context,
      builder: (content){
        return AlertDialog(
          title: Text('提示'),
          content: Text('检测到最新版本，是否进行更新？'),
          actions: [
            FlatButton(
              child: Text('取消'),
              onPressed: (){
                print('取消');
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('确定'),
              onPressed: (){
                print('确定');
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
      );
  }
  // AudioPlayer audioPlayer = AudioPlayer();
  // static AudioCache player = AudioCache();
  //  play(){
  //    player.play('sounds/order_has_complete.mp3');
  //   // int result = await audioPlayer.play("ok.mp3");
  //   // print(result);
  // }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TestDeviceInfo'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _ImageView(_imgPath),
              RaisedButton(
                onPressed: _takePhoto,
                child: Text("拍照"),
              ),
              RaisedButton(
                onPressed: _openGallery,
                child: Text("选择照片"),
              ),
              RaisedButton(
                onPressed: ()=>showDeviceInfo(),
                child: Text("获取信息"),
              ),
              RaisedButton(
                onPressed: ()=>SoundHelper.play(SoundName.ok),
                child: Text("播放声音"),
              ),
              RaisedButton(
                onPressed: ()=>_alertDialog(),
                child: Text("dialog"),
              ),
              RaisedButton(
                onPressed: () {
                  print('我改变了');
                  eventBus.fire(ThemeColorEvent(Colors.blue));
                },
                child: Text("eventBus"),
              ),
              RaisedButton(
                onPressed: () {
                  print('我要把这玩意染成绿的');
                  eventBus.fire(ThemeColorEvent(Colors.green));
                  eventBus.fire(ScanReceive('CF200707110'));
                },
                child: Text("我要把这玩意染成绿的"),
              ),
              RaisedButton(
                onPressed: () {
                  _scan();
                },
                child: Text("扫描二维码"),
              ),
              TextField(
                controller: TextEditingController.fromValue(TextEditingValue(
                    text: content,
                    selection: TextSelection.fromPosition(TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: content.length)))),
                onSubmitted: (value) {
                  showToast("提交成功");
                },
                decoration: InputDecoration(
                  hintText: '请输入用户名',
                  labelText: "用户名",
                ),
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
              )
            ],
          ),
        ));
  }

  /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
}
