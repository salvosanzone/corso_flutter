// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
      title: json['title'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      picture: json['picture'] as String?,
      registerDate: json['registerDate'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'registerDate': instance.registerDate,
      'phone': instance.phone,
      'picture': instance.picture,
      'location': instance.location?.toJson(),
    };
