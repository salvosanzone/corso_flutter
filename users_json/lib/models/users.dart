import 'package:users_json/models/address.dart';
import 'package:users_json/models/bank.dart';
import 'package:users_json/models/company.dart';
import 'package:users_json/models/hair.dart';
import 'package:json_annotation/json_annotation.dart';
part'users.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class Users {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final int height;
  final double weight;
  final String eyeColor;
  final Hair hair;
  final String domain;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;

  const Users({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.age,
    required this.bank,
    required this.birthDate,
    required this.bloodGroup,
    required this.company,
    required this.domain,
    required this.ein,
    required this.eyeColor,
    required this.firstName,
    required this.gender,
    required this.hair,
    required this.height,
    required this.image,
    required this.ip,
    required this.lastName,
    required this.macAddress,
    required this.maidenName,
    required this.password,
    required this.phone,
    required this.ssn,
    required this.university,
    required this.userAgent,
    required this.weight
});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);

}