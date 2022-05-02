import 'tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag_response.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class TagResponse {
  final List<Tag> data;
  final int total;
  final int page;
  final int limit;
  const TagResponse({
    required this.data,
    required this.total,
    required this.limit,
    required this.page
  });

  factory TagResponse.fromJson(Map<String, dynamic> json) => _$TagResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TagResponseToJson(this);
}