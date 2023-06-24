import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prod_mobile/src/app/app.module.dart';
import 'package:prod_mobile/src/routers/application.dart';
import 'package:shared_preferences/shared_preferences.dart';


class API {
  static String baseUrl = "http://192.168.2.16:5555";
  static String version = "TEST.V1.04April2023";
  final Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 30000),
    // sendTimeout: 60000,
    receiveTimeout: const Duration(milliseconds: 30000),
    // contentType: 'application/json; charset=utf-8',
    baseUrl: baseUrl,
    headers: {"Accept": "application/json", "content-type": "application/json"},
  ));

  API() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          if (Application.sharePreference!.hasKey("token")) {
            options.headers["Authorization"] =
            "Bearer ${Application.sharePreference!.getString("token")}";
          }
          if (Application.sharePreference!.hasKey("userId")) {
            options.headers["Abp.userId"] =
            "${Application.sharePreference!.getInt("userId")}";
          }

          // only open  this for debug
          print(options.uri);

          return handler.next(options);


        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioError e, ErrorInterceptorHandler handler) async {

          handleTimeOutException(e.type);
          // Refresh Token

          if (e.response?.statusCode == 401) {
            Map<String, dynamic> data = {
              "refreshToken":
              await Application.sharePreference!.getString("refreshToken")
            };
            var response = await dio.post("/api/TokenAuth/RefreshToken",
                queryParameters: data);
            if (response.statusCode == 200) {
              var newAccessToken = response.data["result"]
              ["accessToken"]; // get new access token from response
              var newRefreshToken = response.data["result"]
              ["refreshToken"]; // get new refresh token from response
              Application.sharePreference
                ?..putString("token", "$newAccessToken")
                ..putString("refreshToken", "$newRefreshToken");

            } else {
              // await Modular.to.showDialog(
              //     builder: (context) => TimeoutDialog(
              //         title: "Your login session has expired. Please login again"
              //             .i18n));
              // if (Application.sharePreference.hasKey("deviceTokenId")) {
              //   await NotificationService.deleteDeviceToken({
              //     "DeviceTokenId":
              //     Application.sharePreference.getInt("deviceTokenId")
              //   });
              // })
              await Application.sharePreference!
                  .clearAllExcept(["credentialData", "password"]);
              await Modular.to.pushNamedAndRemoveUntil(
                  AppModule.landing, ModalRoute.withName(Modular.initialRoute));
            }
          }


          return handler.next(e);
        },
      ),
    );
  }

  void handleTimeOutException(DioErrorType type) {
    switch (type) {
    /*  case DioErrorType.connectionError:
        Application.toastify.showToastFailed(
            "Lỗi kết nối từ điện thoại. Vui lòng kiểm tra lại mạng 3G hoặc wifi",);
        break;
      case DioErrorType.sendTimeout:
        Application.toastify.showToast(
            "Lưu KHÔNG thành công. Kiểm tra lại kết nối mạng 3G hoặc Wifi");
        break;
      case DioErrorType.receiveTimeout:
        Application.toastify.showToast(
            "Lấy thông tin dữ liệu từ máy chủ thất bại. Kiểm tra lại kết nối điện thoại 3G hoặc Wifi");
        break;*/
      default:
        break;
    }
  }


  Future get(String url, [Map<String, dynamic>? params]) async {
    return dio.get(url, queryParameters: params);
  }

  Future post(String url, [Map<String, dynamic>? params]) async {
    final prefs = await SharedPreferences.getInstance();
    String? authentications = prefs.getString('authentication');
    dio.options.headers["authorization"] = "Bearer $authentications";

    return await dio.post(url, data: params);
  }

  Future put(String url, [Map<String, dynamic>? params]) async {
    // return dio.put(url, data: params);
  }

  Future delete(String url, [Map<String, dynamic>? params]) async {
    // return dio.delete(url, queryParameters: params);
  }
}
