import 'location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_response.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class LocationResponse {
  final List<Location> data;
  final int total;
  final int page;
  final int limit;
  const LocationResponse({
    required this.data,
    required this.total,
    required this.limit,
    required this.page
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) => _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}