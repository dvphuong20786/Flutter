
import 'package:json_annotation/json_annotation.dart';


import 'AssemblyScreenItem.dart';

part 'AssemblyScreenList.g.dart';

@JsonSerializable()
class AssemblyScreenList {

  List<AssemblyScreenItem>? items;


  AssemblyScreenList({ this.items });

  factory AssemblyScreenList.fromJson(Map<String, dynamic> json) => _$AssemblyScreenListFromJson(json);

  Map<String, dynamic> toJson() => _$AssemblyScreenListToJson(this);
}




