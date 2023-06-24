// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Applications _$ApplicationsFromJson(Map<String, dynamic> json) => Applications(
      id: json['id'] as int?,
      appName: json['appName'] as String,
      ordering: json['ordering'] as int?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$ApplicationsToJson(Applications instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appName': instance.appName,
      'ordering': instance.ordering,
      'status': instance.status,
    };
