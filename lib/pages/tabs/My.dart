import 'package:com.sycfgroup.android.mis/modes/goodList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=>GoodsListProvider(),
      child: _buildContent(),
    );
  }

  Widget _buildContent(){
    return Selector<GoodsListProvider, GoodsListProvider>(
        selector: (context, provider) => provider,
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.total,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed("/first_screen");
                    },
                    child: Text("第二页"),
                  ),
                ),
                title: Text(provider.goodsList[index]['detail_no']),
                trailing: Selector<GoodsListProvider, bool>(
                  selector: (context, provider) =>
                      provider.goodsList[index]['selected'],
                  builder: (context, data, child) {
                    print(('No.${index + 1} rebuild'));
                    return GestureDetector(
                      onTap: () {
                        provider.selected(index);
                      },
                      child: Icon(data ? Icons.star : Icons.star_border),
                    );
                  },
                ),
              );
            },
          );
        });
  }
}
