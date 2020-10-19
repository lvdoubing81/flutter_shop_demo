
import 'package:com.sycfgroup.android.mis/modes/CounterProvider.dart';
import 'package:com.sycfgroup.android.mis/pages/testProvider/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';



class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CounterModel>(context).value;
    // final textSize = Provider.of<int>(context).toDouble();
    print("第一页面创建");
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Text(
          'Value: $value',
          style: TextStyle(fontSize: 48),
        )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondScreen())),
        child: Icon(Icons.navigate_next),
      )
  );
  }
}