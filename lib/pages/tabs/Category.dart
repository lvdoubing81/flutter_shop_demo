import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:com.sycfgroup.android.mis/modes/goodList.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TabBar(
                  tabs: [
                    Tab(
                      text: '热销',
                    ),
                    Tab(
                      text: '推荐',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Selector<GoodsListProvider,GoodsListProvider>(
              builder: (context,provider,child){
                return ListView.builder(
                  itemCount: provider.total,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(provider.goodsList[index]["detail_no"]),
                      trailing: Selector<GoodsListProvider,bool>(
                        selector: (context, provider) => provider.goodsList[index]["selected"],
                        builder: (context, data, child){
                          return IconButton(icon: data ? Icon(Icons.star) : Icon(Icons.star_border), onPressed: (){
                            print("点击 $data");
                            provider.selected(index);
                          });
                        },
                      ),
                    );
                  });
              }, selector: (context,provider)=>provider),
            ListView(
              children: [
                ListTile(
                  title: Text('第二个tab'),
                ),
                ListTile(
                  title: Text('第二个tab'),
                ),
                ListTile(
                  title: Text('第二个tab'),
                ),
                ListTile(
                  title: Text('第二个tab'),
                ),
                ListTile(
                  title: Text('第二个tab'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
