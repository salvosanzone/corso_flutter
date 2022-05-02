// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      publishDate: json['publishDate'] as String?,
      id: json['id'] as String?,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      post: json['post'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'post': instance.post,
      'publishDate': instance.publishDate,
      'owner': instance.owner.toJson(),
    };
