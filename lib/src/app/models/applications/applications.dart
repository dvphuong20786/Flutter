import 'package:json_annotation/json_annotation.dart';

part 'applications.g.dart';

@JsonSerializable()
class Applications {
  int? id;
  String appName = '';
  int? ordering;
  bool? status;

  Applications(
      {required this.id,
      required this.appName,
      required this.ordering,
      required this.status});

  factory Applications.fromJson(Map<String, dynamic> json) =>
      _$ApplicationsFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationsToJson(this);
}
