import 'package:users_json/models/users.dart';
import 'package:json_annotation/json_annotation.dart';

part'users_response.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class UsersResponse {
  final int total;
  final dynamic skip;
  final int limit;
  final List<Users> users;

  const UsersResponse({required this.limit, required this.skip, required this.total, required this.users});

  factory UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}