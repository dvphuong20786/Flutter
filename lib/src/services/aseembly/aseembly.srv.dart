import 'package:prod_mobile/src/routers/application.dart';

class AseemblyService {
  static Future<dynamic> getData(Map<String, dynamic> params) {
    return Application.api.post('/api/services/app/AsyAdoAssemblyScreen/GetScreenData?prod_line=A1');
  }

  static Future<dynamic> getDataConfig(Map<String, dynamic> params){
    return Application.api.post('/api/services/app/AsyAdoAssemblyScreen/GetScreenConfig?screen_code=ENGINE_LINE_A1');
  }



}