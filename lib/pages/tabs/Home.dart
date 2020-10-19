import 'package:com.sycfgroup.android.mis/modes/goodList.dart';
import 'package:com.sycfgroup.android.mis/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:com.sycfgroup.android.mis/utils/event_bus.dart';

import 'package:provider/provider.dart';

import '../../modes/CounterProvider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colorSub;
  var scanner;
  void testEvent() {
    // colorSub =  eventBus.on<ThemeColorEvent>().listen((event) {
    //     print('我home页面收到了'+event.colorStr.toString());
    //   });
    scanner = eventBus.on<ScanReceive>().listen((event) {
      print('我home页面收到了缸号' + event.scanReceive.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    testEvent();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //取消订阅
    print('home取消了颜色订阅');
    // colorSub.cancel();
  }

  Map _formData = {'id': '我是传过来的表单数据啊'};
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('搜查页面'),
          onPressed: () {
            print('跳转搜索页面');
            //路由跳转
            Navigator.of(context).pushNamed('/search');
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        RaisedButton(
          child: Text('test页面'),
          onPressed: () {
            print('跳转搜索页面');
            //路由跳转
            Navigator.of(context).pushNamed('/test');
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        RaisedButton(
          child: Text('device页面'),
          onPressed: () {
            print('跳转测试页面');
            //路由跳转
            Navigator.pushNamed(context, '/getDevice');
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('自动更新页面'),
          onPressed: () {
            //路由跳转
            Navigator.pushNamed(context, '/welcome');
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('地址填写页面'),
          onPressed: () {
            //路由跳转
            Navigator.pushNamed(context, '/upData');
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('按钮2'),
          onPressed: () {
            print('点击了按钮2');

            Navigator.pushNamed(context, '/form', arguments: _formData);
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context)=>FormPage(formData:this._formData)
            //   )
            // );
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        RaisedButton(
          child: Text('按钮3'),
          onPressed: () {
            print('点击了按钮3');

            Navigator.pushNamed(context, '/tabBarController');
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context)=>FormPage(formData:this._formData)
            //   )
            // );
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(
          height: 20,
        ),
        // Consumer2<CounterModel, int>(
        //   builder: (context, CounterModel counter, int textSize, _) =>
        //       Center(
        //     child: Text(
        //       'Value: ${counter.value}',
        //       style: TextStyle(
        //         fontSize: textSize.toDouble(),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('显示底部消息'),
          onPressed: () {
            print('显示底部消息');
            showModalBottomSheet(
                context: context,
                isScrollControlled:true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (context) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      )),
                      height: 550,
                      margin: EdgeInsets.only(left: 12, right: 12),
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 30,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop("我是返回的数据");
                            },
                            child: Text("返回"),
                          ),
                        ),
                      ),
                    )).then((value) => print(value ?? "我是假的"));
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ],
    );
  }
}
