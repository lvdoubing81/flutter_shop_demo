
import 'package:flutter/material.dart';


/// APP中用到的常量
class Constants{
//  static const String BASEURL = "http://192.168.102.218/webapi/api";        // 公司服务器地址
//  static const String BASEURL = "http://192.168.31.86/webapi/api";            // 家庭服务器地址
  static const String BASEURL = "http://getnt81.gfg1.esquel.com/KMISFNWrite/api";

  static const String Honeywell_Barcode_Scanner_Channel = "channel/honeywell_barcode_scanner";
  static const String Method_Channel = "channel/flutter_method_channel";
  static const String Nfc_Event_Channel = "channel/nfc";


  /// cache key
  static const String BASE_URL_CACHE = "base_url_cache";
}


//enum RouteName {
//  one,
//  two,
//  three,
//}


/// APP中使用到的颜色
class AppColors {
  static const Color themeColor = Colors.blueGrey;        // 系统主题色

  static const Color headerBackground = Colors.blueGrey;      // 列表标题背景
  static const Color headerForeground = Colors.white;     // 列表标题文字

  static const Color listIndex = Colors.deepOrange;       // 列表索引字体颜色

  static const Color itemKey = Colors.black87;            // 列表文字字段的颜色
  static const Color itemValue = Colors.blue;             // 列表文字内容的颜色

  static const Color errorText = Colors.redAccent;
  static const Color infoText = Colors.blue;

  static const Color activeButtonTextColor = Colors.white;
  static const Color activeButtonBackground = Colors.deepOrange;          // 按钮可用时的背景颜色

  static const Color disabledButtonTextColor = Colors.white;
  static const Color disabledButtonBackground = Colors.grey;              // 不可用按钮控件的颜色

  static const Color activeText = Colors.black87;
  static const Color inactiveText = Colors.black12;
}