import 'package:social_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class Post {
  final String? id;
  final String text;
  final String image;
  final int? likes;
  final List<String> tags;
  final String? publishDate;
  final User owner;

  const Post({
    required this.owner,
    this.id,
    required this.image,
    required this.text,
    this.likes,
    this.publishDate,
    required this.tags
});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

}