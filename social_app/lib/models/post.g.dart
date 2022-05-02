// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      id: json['id'] as String?,
      image: json['image'] as String,
      text: json['text'] as String,
      likes: json['likes'] as int,
      publishDate: json['publishDate'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'image': instance.image,
      'likes': instance.likes,
      'tags': instance.tags,
      'publishDate': instance.publishDate,
      'owner': instance.owner.toJson(),
    };
