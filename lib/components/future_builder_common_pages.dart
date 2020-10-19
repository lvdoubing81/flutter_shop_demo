// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:mis2/apps/app.dart';
// import '../apps/constants.dart';
// // import 'package:mis2/components/rounded_rectangle_button.dart';

// /// 在没有数据时，显示的页面
// /// 在没有提供child时，显示message的内容
// class NonePage extends StatelessWidget {
//   final Widget child;
//   final String message;

//   NonePage({Key key, this.child, this.message})
//       : assert(message != null || child != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(Icons.info_outline, color: Theme.of(context).accentColor, size: 60.0,),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: child ?? Text(message ?? "需要传递message参数",
//               style: TextStyle(color: AppColors.themeColor, fontSize: 18.0
//               ),),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// 在加载数据时，显示的页面
// class LoadingPage extends StatelessWidget {
//   final Widget child;
//   final String message;

//   const LoadingPage({Key key, this.message, this.child})
//       : assert(message != null || child != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           CircularProgressIndicator(),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: child ?? Text(message ?? "",
//               style: TextStyle(color: AppColors.themeColor, fontSize: 18.0
//               ),),
//           ),
//         ],
//       ),
//     );
//   }
// }


// /// 在执行有错误时，显示的页面
// class ErrorPage extends StatelessWidget {
//   final Widget child;
//   final String message;

//   ErrorPage({Key key, this.child, this.message})
//       : assert(message != null || child != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var msg = message ?? "";
//     if (msg.startsWith("Exception:")){
//       msg = msg.replaceFirst("Exception:", "");
//     }

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(Icons.error_outline, color: Colors.redAccent, size: 60.0,),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: child ?? Text(msg,
//               style: TextStyle(color: Colors.redAccent, fontSize: 18.0),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// 在执行有错误时，显示的页面
// class ErrorRetryPage extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String actionTitle;
//   final String message;

//   ErrorRetryPage({Key key, @required this.onPressed, this.actionTitle = "知道了", @required this.message})
//       : assert(onPressed != null && message != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print("$message");
//     var msg = message;
//     if (msg.startsWith("Exception:")){
//       msg = msg.replaceFirst("Exception:", "");
//       print("$msg");
//     }
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(Icons.error_outline, color: Colors.redAccent, size: 60.0,),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(msg ?? "需要传递message参数",
//               style: TextStyle(color: Colors.redAccent, fontSize: 18.0),
//               textAlign: TextAlign.center,
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: RoundedRectangleButton(
//               child: SizedBox(width:120.0, child: Text("$actionTitle", textAlign: TextAlign.center,)),
//               onPressed: onPressed,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// /// 在执行有错误时，显示的页面
// class SuccessPage extends StatelessWidget {
//   final Widget child;
//   final String message;

//   SuccessPage({Key key, this.child, this.message})
//       : assert(message != null || child != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(Icons.info_outline, color: Theme.of(context).accentColor, size: 60.0,),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: child ?? Text(message ?? "需要传递message参数",
//               style: TextStyle(color: AppColors.themeColor, fontSize: 18.0
//               ),),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// 用于FutureBuilder，当有多个地方调用时，不同的返回值显示不同的内容。
// enum FutureResultState {
//   none,
//   active,
//   waiting,
//   error,
//   done,
//   done1,
//   done2,
//   done3,
//   done4,
//   done5,
//   done6,
//   done7,
//   done8,
//   done9,
// }


// /// 提示用户无权访问的页面
// class CheckPermissionPage extends StatelessWidget {
//   final String title;                       // 标题
//   final List<String> privileges;            // 权限ID，满足一个即通过检查
//   final Widget child;                       // 如果有权限，则显示child。

//   const CheckPermissionPage({Key key, @required this.title, @required this.privileges, @required this.child})
//       : assert(title !=null),
//         assert(privileges != null),
//         assert(child != null),
//         super(key: key);

//   bool _checkPermission(){
//     var userPrivileges = App.instance.currentUser.privileges;
//     if (userPrivileges == null){
//       return false;
//     }
//     for(var p in privileges){
//       if (userPrivileges.contains(p)){
//         return true;
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_checkPermission() == true) {
//       return child;
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("$title"),
//         ),
//         body: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Icon(Icons.error_outline, color: Colors.redAccent, size: 60.0,),

//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text("您没有权限使用本功能！",
//                     style: TextStyle(color: Colors.redAccent, fontSize: 18.0
//                     ),),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: RoundedRectangleButton(
//                     child: SizedBox(width: 120.0, child: Text("关闭", textAlign: TextAlign.center,),),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }

// }
