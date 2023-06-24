import 'package:json_annotation/json_annotation.dart';
import 'package:prod_mobile/src/models/aseembly/sps/ac1a1.dart';

part 'ac1a1_list.g.dart';

@JsonSerializable()
class Ac1a1_List {
  List<Ac1a1>? Ac1a1List;

  Ac1a1_List({ this.Ac1a1List});

  factory Ac1a1_List.fromJson(Map<String, dynamic> json) =>
      _$ListAc1a1FromJson(json);

  Map<String, dynamic> toJson() => _$ListAc1a1ToJson(this);
}