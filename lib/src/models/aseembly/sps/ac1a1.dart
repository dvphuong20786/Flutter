
import 'package:json_annotation/json_annotation.dart';

part 'ac1a1.g.dart';
@JsonSerializable()
class Ac1a1 {
  String? process = '';
  String? model = '';
  String? body = '';
  String? seqNo = '';
 Ac1a1({
   required this.process,
   required this.model,
   required this.body,
   required this.seqNo,
});

  factory Ac1a1.fromJson(Map<String, dynamic> json) => _$Ac1a1FromJson(json);
  Map<String, dynamic> toJson() => _$Ac1a1ToJson(this);

}