import 'package:users_json/models/coordinates.dart';
import 'package:json_annotation/json_annotation.dart';
part'address.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class Address {
  final String address;
  final String? city;
  final Coordinates coordinates;
  final String postalCode;
  final String state;


  const Address({required this.postalCode, required this.state, required this.address, required this.city, required this.coordinates});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}