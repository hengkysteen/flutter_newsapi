import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class App {
  static Widget loading() {
    return CupertinoActivityIndicator();
  }

  static Future push(BuildContext context, Widget widget) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Future toast(String msg) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black87,
      fontSize: 14,
    );
  }
}
