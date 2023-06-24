import 'dart:io';

import 'package:prod_mobile/src/models/aseembly/sps/ac1a1.dart';
import 'package:prod_mobile/src/models/aseembly/sps/ac1a1_.dart';
import 'package:prod_mobile/src/models/aseembly/sps/ac1a1_list.dart';
import 'package:prod_mobile/src/services/aseembly/a1engine.srv.dart';
import 'package:prod_mobile/src/services/aseembly/ac1a1.src.dart';
import 'package:prod_mobile/src/services/aseembly/aseembly.srv.dart';
import 'package:prod_mobile/src/utils/exception.dart';

class AseemblyRepository{
  Future<Ac1a1_List> fetchAc1a1(Map<String, dynamic> params) async {
    final response = await Ac1A1.getData(params);
    return (response.statusCode == 200)
        ? Ac1a1_List.fromJson(response.data["result"] as Map<String, dynamic>)
        : throw NetworkException(
        message: Map<String, dynamic>.from(
            response.data["error"] as Map<dynamic, dynamic>));
  }



  Future<Ac1a1_> ProcessList(Map<String, dynamic> params) async {
    final response = await Ac1A1.GetScreenConfig(params);
    return (response.statusCode == 200)
        ? Ac1a1_.fromJson(response.data["result"] as Map<String, dynamic>)
        : throw NetworkException(
        message: Map<String, dynamic>.from(
            response.data["error"] as Map<dynamic, dynamic>));
  }



}