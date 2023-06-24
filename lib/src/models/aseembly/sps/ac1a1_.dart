import 'package:json_annotation/json_annotation.dart';

part 'ac1a1_.g.dart';

@JsonSerializable(includeIfNull: false)
class Ac1a1_ {
  String? processList;

  Ac1a1_({this.processList});

  factory Ac1a1_.fromJson(Map<String, dynamic> json) => _$Ac1a1_FromJson(json);

  Map<String, dynamic> toJson() => _$Ac1a1_ToJson(this);
}