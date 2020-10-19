import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:com.sycfgroup.android.mis/utils/event_bus.dart';
import 'package:com.sycfgroup.android.mis/pages/testProvider/firstScreen.dart';
import 'package:provider/provider.dart';
import 'routes/Routes.dart';
import './modes/CounterProvider.dart';
void main() {
  final counter = CounterModel();
  final textSize = 48;

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: counter)
    ],
    child: MyApp(),)
  );
}
class MyApp extends StatelessWidget {
  Color _primaryColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh','CH'),
        const Locale('en','US')
      ],
      title: '首页',
      theme: ThemeData(
        primaryColor: _primaryColor,
      ),
      // home: FirstScreen(),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}




// class BottomNavigationBar extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
    
//   }
  
// }

