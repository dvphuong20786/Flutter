import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';



class SpUtil {

  static SpUtil? _instance;

  static Future<SpUtil> get instance async {
    return getInstance();
  }

  static SharedPreferences? _spf;

  SpUtil._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  Future clear() async {
    await _spf!.clear();
  }

  static Future<SpUtil> getInstance() async {
    _instance ??= SpUtil._();
    if (_spf == null) {
      await _instance!._init();
    }
    return _instance!;
  }

  String? getString(String key) {
    return _spf!.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return _spf!.setString(key, value);
  }

  bool? getBool(String key) {
    return _spf!.getBool(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return _spf!.setBool(key, value);
  }

  int? getInt(String key) {
    return _spf!.getInt(key);
  }

  Future<bool> setInt(String key, int value) async {
    return _spf!.setInt(key, value);
  }

  double? getDouble(String key) {
    return _spf!.getDouble(key);
  }

  Future<bool> setDouble(String key, double value) async {
    return _spf!.setDouble(key, value);
  }

  List<String>? getStringList(String key) {

    return _spf?.getStringList(key);
  }

  Future<bool> putStringList(String key, List<String> value) {
    return _spf!.setStringList(key, value);
  }

  bool hasKey(String key) {
    Set keys = getKeys();
    return keys.contains(key);
  }

  Set<String> getKeys() {
    return _spf!.getKeys();
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  Future<bool> putString(String key,String? value) {
    return _spf!.setString(key, value!);
  }

  Future<List<bool>> clearAllExcept(List<String> excepts) {
    Set<String> data = _spf!.getKeys()..removeWhere((element) => excepts.contains(element));
    return Future.wait(data.map((e) => _spf!.remove(e)));
  }

  Future<bool> putInt(String key, int value) {
    return _spf!.setInt(key, value);
  }




}
