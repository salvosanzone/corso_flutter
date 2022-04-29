import 'package:users_json/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part'company.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class Company {
  final Address address;
  final String department;
  final String name;
  final String title;
  const Company({required this.address, required this.name, required this.department, required this.title});


  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);



}