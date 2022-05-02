import 'package:social_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';


part'comment.g.dart';


@JsonSerializable(
  explicitToJson: true
)
class Comment {
  final String? id;
  final String message;
  final String post;
  final String? publishDate;
  final User owner;

  const Comment({
    this.publishDate,
    this.id,
    required this.owner,
    required this.post,
    required this.message
});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}