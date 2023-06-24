import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  String? accessToken ;
  String? encryptedAccessToken;
  int expireInSeconds;
  bool shouldResetPassword;
  //String? passwordResetCode;
  int userId;
  bool requiresTwoFactorVerification;
 // List<String>? twoFactorAuthProviders;
 // String? twoFactorRememberClientToken;
  //String? returnUrl;
  String? refreshToken;
  int refreshTokenExpireInSeconds;

  User(
      {required this.accessToken,
      required this.encryptedAccessToken,
      required this.expireInSeconds,
      required this.shouldResetPassword,
     // required this.passwordResetCode,
      required this.userId,
      required this.requiresTwoFactorVerification,
      // required this.twoFactorAuthProviders,
      // required this.twoFactorRememberClientToken,
      // required this.returnUrl,
      required this.refreshToken,
      required this.refreshTokenExpireInSeconds});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
