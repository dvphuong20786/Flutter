/*
import 'dart:convert';

import 'package:prod_mobile/src/app/models/applications/applications.dart';
import 'package:prod_mobile/src/app/models/user/user.dart';
import 'package:prod_mobile/src/services/home/home.srv.dart';
import '../../utils/exception.dart';

class HomeRepository {
  Future<List<Applications>> getAllApp() async {
    final response = await HomeService.getAllApp();
    return response.statusCode == 200 ? (response.data as List).map((e) => Applications.fromJson(e)).toList() : [];
  }

  Future<User> getUserInfo([Map<String, dynamic>? params]) async {
    final response = await HomeService.getUserInfo(params);
    return response.statusCode == 200 ? User.fromJson(response.data) : throw NetworkException();
  }
}
*/
