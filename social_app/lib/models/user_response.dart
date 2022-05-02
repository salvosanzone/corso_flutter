import 'package:social_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class UserResponse {
  final List<User> data;
  final int total;
  final int page;
  final int limit;


  const UserResponse({
    required this.data,
    required this.total,
    required this.limit,
    required this.page
});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}