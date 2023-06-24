import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prod_mobile/src/Models/user/user.dart';
import 'package:prod_mobile/src/repositories/authentication/authentication.repository.dart';
import 'package:prod_mobile/src/routers/application.dart';
import 'package:prod_mobile/src/utils/exception.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
part 'login.state.dart';


class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginCubit(this._authenticationRepository) : super(const LoginInitial());

  late final String _message;

  String get message => _message;

  bool rememberPassword =
      Application.sharePreference?.getStringList("credentialData")?.length == 4
          ? true
          : false;

  void changeCheckbox(val) => rememberPassword = val as bool;

  @override
  void initState(){
    login({});
  }

  Future<bool> login(Map<String, dynamic> data) async {
    // if (data['checkBox'] == true) {
    //    Application.sharePreference!.putStringList(
    //        "credentialData", data.values.map((e) => e.toString()).toList());
    //  } else {
    //    List<String> temp = data.values.map((e) => e.toString()).toList();
    //    temp.removeLast();
    //    Application.sharePreference!.putStringList("credentialData", temp);
    //  }
    try {

      emit(const Signing());
      Map<String, dynamic> params = {
        "userNameOrEmailAddress": data['user_name'],
        "password": data['password'],
        "rememberClient": false,
      };
      User usr = await _authenticationRepository.login(params);
      if (usr.accessToken == null) {
        Application.sharePreference!.putString('OtpCode', usr.accessToken);
        var par = {"userId": usr.userId, "provider": "GoogleAuthenticator"};
        var isSendTwoFactorAuth =
            await _authenticationRepository.sendTwoFactorAuthCode(par);
        Application.sharePreference
          ?..putString("userName", data['user_name'] as String)
          ..putString("password", data['password'] as String);
        emit(const Signed());
        return isSendTwoFactorAuth;
      }

      // if (usr.shouldResetPassword) {
      //   Application.sharePreference
      //     ?..putString("resetCode", usr.passwordResetCode)
      //     ..putInt('userId', usr.userId);
      // } else {
      //   Application.sharePreference
      //     ?..putString('token', usr.accessToken)
      //     ..putString('refreshToken', usr.refreshToken)
      //     ..putInt('userId', usr.userId);
      // }
      // var dvt = {
      //   "DeviceToken":
      //       await PushNotificationsManager.firebaseMessaging.getToken()
      // };
      // // Application.sharePreference?.putInt(
      // //     "deviceTokenId", await _authenticationRepository.getDeviceToken(dvt));
      // var param = {"Id": Application.sharePreference?.getInt("userId")};
      //
      // Profile profile = await _authenticationRepository.getUserData(param);
      // Application.sharePreference
      //     .putBool("checkPolicy", profile.isPolicyConfirmed);
      emit(const Signed());
      return true;
    } on NetworkException catch (e) {
      _message =
          e.message["message"] != null ? e.message["message"] as String : "";
      emit(const Signed());
      return false;
    }
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
  }
}
