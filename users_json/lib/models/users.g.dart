// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      age: json['age'] as int,
      bank: Bank.fromJson(json['bank'] as Map<String, dynamic>),
      birthDate: json['birthDate'] as String,
      bloodGroup: json['bloodGroup'] as String,
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      domain: json['domain'] as String,
      ein: json['ein'] as String,
      eyeColor: json['eyeColor'] as String,
      firstName: json['firstName'] as String,
      gender: json['gender'] as String,
      hair: Hair.fromJson(json['hair'] as Map<String, dynamic>),
      height: json['height'] as int,
      image: json['image'] as String,
      ip: json['ip'] as String,
      lastName: json['lastName'] as String,
      macAddress: json['macAddress'] as String,
      maidenName: json['maidenName'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      ssn: json['ssn'] as String,
      university: json['university'] as String,
      userAgent: json['userAgent'] as String,
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'age': instance.age,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'birthDate': instance.birthDate,
      'image': instance.image,
      'bloodGroup': instance.bloodGroup,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': instance.eyeColor,
      'hair': instance.hair.toJson(),
      'domain': instance.domain,
      'ip': instance.ip,
      'address': instance.address.toJson(),
      'macAddress': instance.macAddress,
      'university': instance.university,
      'bank': instance.bank.toJson(),
      'company': instance.company.toJson(),
      'ein': instance.ein,
      'ssn': instance.ssn,
      'userAgent': instance.userAgent,
    };
