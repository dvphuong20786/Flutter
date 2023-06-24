import 'package:prod_mobile/src/routers/application.dart';

class Ac1A1{
  static Future<dynamic> getData(Map<String, dynamic> params) {
    return Application.api.get('/api/services/app/AsyAdoAssemblyScreen/GetScreenData?prod_line=A1');
  }
  static Future<dynamic> GetScreenConfig(Map<String, dynamic> params){
    return Application.api.get('/api/services/app/AsyAdoAssemblyScreen/GetScreenConfig?screen_code=ENGINE_LINE_AC1_A1');
  }
}