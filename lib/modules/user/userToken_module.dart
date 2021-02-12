import 'package:json_annotation/json_annotation.dart';

part 'userToken_module.g.dart';

@JsonSerializable()
class UserToken{
  String token;


  UserToken({this.token});


  @override
  String toString() {
    return 'UserToken{token: $token}';
  }

  factory UserToken.fromJson(Map<String, dynamic> json) => _$UserTokenFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenToJson(this);
}