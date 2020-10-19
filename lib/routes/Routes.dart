
import 'package:com.sycfgroup.android.mis/pages/test/download_app.dart';
import 'package:com.sycfgroup.android.mis/pages/testProvider/firstScreen.dart';
import 'package:com.sycfgroup.android.mis/pages/testProvider/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:com.sycfgroup.android.mis/pages/test/show_new_app.dart';
import 'package:com.sycfgroup.android.mis/pages/welcome.dart';
import '../pages/Tabs.dart';
import '../pages/Form.dart';
import '../pages/Search.dart';
import '../pages/TabBarController.dart';
import '../pages/test.dart';
import '../pages/test/url.dart';
import '../pages/test/get_devicr_info.dart';
import '../pages/test/updata.dart';
import '../pages/test/download_app.dart';

final routes = {
        '/':(content)=>Tabs(),
        '/form': (context,{arguments})=>
            FormPage(arguments : arguments),
        '/search':(context)=>Search(),
        '/tabBarController':(context)=>TabBarControllerPage(),
        '/test':(context)=>Test(),
        '/testUrl':(context)=>TestUrl(),
        '/getDevice':(context)=>TestDeviceInfo(),
        '/upData':(context)=>UpDataPage(),
        '/showNewApp': (context,{arguments})=>
            ShowNewApp(arguments : arguments),
        '/welcome':(context)=>WelcomePage(),
        '/download_app':(context)=>DownloadApp(),
        '/first_screen':(context)=>FirstScreen(),
        '/second_screen':(context)=>SecondScreen()
      };

// 固定写法，统一处理，无需更改
// @override
// Widget build(BuildContext context) {
//   return ;
// }

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};