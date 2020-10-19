import 'package:com.sycfgroup.android.mis/modes/CounterProvider.dart';
import 'package:com.sycfgroup.android.mis/modes/goodList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("第二页面创建");
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Selector<CounterModel,int>(
        selector: (context,provider) => provider.value,
        builder: (context, value, child) => Center(
              child: Text(
                'Value: $value',
                style: TextStyle(
                  fontSize: 48,
                ),
              ),
            ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
              onPressed: counter.increment,
              child: child,
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}

