import 'package:json_annotation/json_annotation.dart';

part 'authentication.g.dart';

@JsonSerializable()
class Authentication {
  int userId = 0;
  String jwtToken = '';
  String userName = '';
  int expiresIn = 0;
  String dataStage = '';

  Authentication(
      {required this.userId,
      required this.jwtToken,
      required this.userName,
      required this.expiresIn,
      required this.dataStage});

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);
}
