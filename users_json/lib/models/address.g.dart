// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      postalCode: json['postalCode'] as String,
      state: json['state'] as String,
      address: json['address'] as String,
      city: json['city'] as String?,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'coordinates': instance.coordinates.toJson(),
      'postalCode': instance.postalCode,
      'state': instance.state,
    };
