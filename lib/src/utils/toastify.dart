import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastify {


  void showToastNotification(String msg,) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xfff1f1f1),
      textColor: Colors.black54,
      fontSize: 16.0,
    );
  }
}
