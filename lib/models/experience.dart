import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

String _categoryToJson(String category) => category.trim().toLowerCase();

DateTime? _dateTimeFromJson(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is String && value.isNotEmpty) {
    return DateTime.tryParse(value);
  }
  return null;
}

/// Portfolio experience entry synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Experience {
  const Experience({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.categoryDisplay = '',
    this.thumbnail,
    this.startedAt,
    this.endedAt,
    this.isOngoing = false,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;

  final String title;
  final String description;

  @JsonKey(toJson: _categoryToJson)
  final String category;

  @JsonKey(includeToJson: false, defaultValue: '')
  final String categoryDisplay;

  final String? thumbnail;

  @JsonKey(includeToJson: false, fromJson: _dateTimeFromJson)
  final DateTime? startedAt;

  @JsonKey(fromJson: _dateTimeFromJson)
  final DateTime? endedAt;

  @JsonKey(includeToJson: false, defaultValue: false)
  final bool isOngoing;

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
