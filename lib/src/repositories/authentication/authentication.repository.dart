
import 'package:prod_mobile/src/Models/user/user.dart';
import 'package:prod_mobile/src/services/authentication/authentication.srv.dart';
import 'package:prod_mobile/src/utils/exception.dart';

class AuthenticationRepository {

  Future<User> login(Map<String, dynamic> params) async {
    final response = await AuthenticationService.login(params);
    return (response.statusCode == 200)
        ? User.fromJson(response.data["result"] as Map<String, dynamic>)
        : throw NetworkException(
        message: Map<String, dynamic>.from(
            response.data["error"] as Map<dynamic, dynamic>));
  }


  Future<bool> sendTwoFactorAuthCode(Map<String, dynamic> params) async {
    final response = await AuthenticationService.sendTwoFactorAuthCode(params);
    return (response.statusCode == 200);
  }

  Future<bool> logout() async {
    final response = await AuthenticationService.logout();
    return (response.statusCode == 200)
        ? response.data["success"] as bool
        : throw NetworkException(  message: Map<String, dynamic>.from(
        response.data["error"] as Map<dynamic, dynamic>));
  }
}
