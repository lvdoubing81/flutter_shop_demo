import 'package:flutter/material.dart';
class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key key}) : super(key: key);

  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    
    super.initState();
    _tabController = TabController(vsync: this,length: 2);
    _tabController.addListener(() {
      if(_tabController.index.toDouble() == _tabController.animation.value){
            switch (_tabController.index) {
                case 0:
                  print(0);
                  break;
                case 1:
                  print(1);
                  break;
              }
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("TabBarControllerPage"),
         bottom: new TabBar(
           controller: this._tabController,
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: '热销',),
              Tab(text: '推荐',),
            ]
         ),
       ),
       body:TabBarView(
         controller: this._tabController,
         children: [
           Center(child: Text('热销'),),
           Center(child: Text('推荐'),),
         ],
       )
    );
  }
}