// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    accessToken: json['accessToken'] as String,
    encryptedAccessToken: json['encryptedAccessToken'] as String,
    expireInSeconds: json['expireInSeconds'] as int,
    shouldResetPassword: json['shouldResetPassword'] as bool,
    //passwordResetCode: json['passwordResetCode'] as String,
    userId: json['userId'] as int,
    requiresTwoFactorVerification:
    json['requiresTwoFactorVerification'] as bool,
    // twoFactorAuthProviders: (json['twoFactorAuthProviders'] as List)
    //     ?.map((e) => e as String)
    //     ?.toList(),
    // twoFactorRememberClientToken:
    // json['twoFactorRememberClientToken'] as String,
    //returnUrl: json['returnUrl'] as String,
    refreshToken: json['refreshToken'] as String,
    refreshTokenExpireInSeconds: json['refreshTokenExpireInSeconds'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'encryptedAccessToken': instance.encryptedAccessToken,
  'expireInSeconds': instance.expireInSeconds,
  'shouldResetPassword': instance.shouldResetPassword,
  //'passwordResetCode': instance.passwordResetCode,
  'userId': instance.userId,
  'requiresTwoFactorVerification': instance.requiresTwoFactorVerification,
  // 'twoFactorAuthProviders': instance.twoFactorAuthProviders,
  // 'twoFactorRememberClientToken': instance.twoFactorRememberClientToken,
  //'returnUrl': instance.returnUrl,
  'refreshToken': instance.refreshToken,
  'refreshTokenExpireInSeconds': instance.refreshTokenExpireInSeconds,
};
