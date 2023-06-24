import 'package:prod_mobile/src/routers/application.dart';


class AuthenticationService {

  static Future<dynamic> login(Map<String, dynamic> params) {
    return Application.api.post('/api/TokenAuth/Authenticate', params);
  }

  static Future<dynamic> sendTwoFactorAuthCode(Map<String, dynamic> params) {
    return Application.api.post('/api/TokenAuth/SendTwoFactorAuthCode', params);
  }

  static Future<dynamic> getUserData(Map<String, dynamic> params){
    return Application.api.get('');
  }

  static Future<dynamic> logout(){
    return Application.api.get('/api/TokenAuth/LogOut');
  }


}