import 'dart:async';
import 'package:flutter/material.dart';

class Common {

  Timer setTimeout(callback, [int duration = 1000]) {
    return Timer(Duration(milliseconds: duration), callback);
  }

  void clearTimeout(Timer _timer) {
    try{
      _timer.cancel();
    } catch(e){ }
  }
}