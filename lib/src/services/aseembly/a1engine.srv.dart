import 'package:prod_mobile/src/routers/application.dart';

class A1Engine {
  static Future<dynamic> getData(Map<String, dynamic> params) {
    return Application.api.post('/api/services/app/AsyAdoAssemblyScreen/GetScreenData?prod_line=A1');
  }



}