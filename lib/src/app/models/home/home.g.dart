// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Homes _$HomesFromJson(Map<String, dynamic> json) => Homes(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),


      applications: (json['applications'] as List<dynamic>?)
          ?.map((e) => Applications.fromJson(e as Map<String, dynamic>))
          .toList(),


    );


Map<String, dynamic> _$HomesToJson(Homes instance) => <String, dynamic>{
      // 'user': instance.user,
      'applications': instance.applications,
    };
