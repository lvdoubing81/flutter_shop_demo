
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  final BuildContext context;

  DialogHelper(this.context);

  DialogHelper.of(this.context);

  Future<void> info(String message, {VoidCallback action}) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text(message, style: TextStyle(fontSize: 20.0),),
        actions: <Widget>[
          CupertinoButton(
            child: Text("确定"), onPressed: (){
            Navigator.of(context).pop(true);
            if (action != null) {
              action();
            }
          },),
        ],
      ),
    );
  }

  Future<bool> confirm(String message, {String positive = "是", String negative = "否"}) async {
     return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Text(message, style: TextStyle(fontSize: 20.0),),
          actions: <Widget>[
            CupertinoButton(
              child: Text(positive),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            CupertinoButton(
              child: Text(negative),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        );
      }
    ) ?? false;
  }


  Future<void> error(String message, {VoidCallback action}) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text(message, style: TextStyle(fontSize: 16.0),),
        actions: <Widget>[
          FlatButton(child: Text("确定"), onPressed: (){
            Navigator.of(context).pop(true);
            if (action != null) {
              action();
            }
          },),
        ],
      ),
    );
  }


}