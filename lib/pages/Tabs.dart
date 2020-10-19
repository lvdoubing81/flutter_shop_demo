import 'package:com.sycfgroup.android.mis/modes/goodList.dart';
import 'package:flutter/material.dart';
import 'package:com.sycfgroup.android.mis/utils/event_bus.dart';
import 'package:provider/provider.dart';
import 'tabs/Category.dart';
import 'tabs/My.dart';
import 'tabs/Home.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  Color _primaryColor = Colors.pink;
  var hadChange = false;
  int _currenyIndex = 0;
  List _pageList = [
    HomePage(),
    CategoryPage(),
    MyPage(),
  ];
  var colorSub;
  // void testEvent(){
  //   colorSub = eventBus.on<ThemeColorEvent>().listen((event) {
  //       print('我收到了'+event.colorStr.toString());
  //       setState(() {
  //         _primaryColor = event.colorStr;
  //       });
  //       print("我改变了自己的颜色");
  //     });
  // }

  @override
  void initState() {
    // TODO: implement initState
    // testEvent();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //取消订阅
    print('tabs取消了订阅');
    colorSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoodsListProvider(),
      child: Theme(
        data: ThemeData(primaryColor: _primaryColor),
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('首页'),
          ),
          body: this._pageList[this._currenyIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                this._currenyIndex = index;
              });
              print(index);
            },
            currentIndex: this._currenyIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('主页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), title: Text('分类')),
              BottomNavigationBarItem(icon: Icon(Icons.shop), title: Text('我的'))
            ],
          ),
        ),
      ),
    );
  }
}
