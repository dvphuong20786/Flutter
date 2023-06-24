// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) =>
    Authentication(
      userId: json['userId'] as int,
      jwtToken: json['jwtToken'] as String,
      userName: json['userName'] as String,
      expiresIn: json['expiresIn'] as int,
      dataStage: json['dataStage'] as String,
    );

Map<String, dynamic> _$AuthenticationToJson(Authentication instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'jwtToken': instance.jwtToken,
      'userName': instance.userName,
      'expiresIn': instance.expiresIn,
      'dataStage': instance.dataStage,
    };
