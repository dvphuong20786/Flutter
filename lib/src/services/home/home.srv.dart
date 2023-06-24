import 'package:prod_mobile/src/routers/application.dart';


class HomeService {
  static Future<dynamic> getAllApp() {
    return Application.api.post('/api/api-profile/Profile/GetAllApp');
  }

  static Future<dynamic> getUserInfo([Map<String, dynamic>? params]) {
    return Application.api.post('/api/api-profile/Profile/GetInfoUser', params);
  }
}
