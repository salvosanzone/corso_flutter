import 'package:social_app/models/location.dart';
import 'package:json_annotation/json_annotation.dart';

part'user.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class User {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? email;
  final String? dateOfBirth;
  final String? registerDate;
  final String? phone;
  final String? picture;
  final Location? location;

  const User({
    this.firstName,
    this.lastName,
    this.phone,
    this.gender,
    this.email,
    this.id,
    this.title,
    this.dateOfBirth,
    this.location,
    this.picture,
    this.registerDate
});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}