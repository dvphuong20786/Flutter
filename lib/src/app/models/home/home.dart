
import 'package:json_annotation/json_annotation.dart';
import 'package:prod_mobile/src/Models/user/user.dart';

import 'package:prod_mobile/src/app/models/applications/applications.dart';

part 'home.g.dart';

@JsonSerializable()
class Homes {
  User? user;
  List<Applications>? applications;



  Homes({ this.user, this.applications});

  factory Homes.fromJson(Map<String, dynamic> json) => _$HomesFromJson(json);

  Map<String, dynamic> toJson() => _$HomesToJson(this);
}
