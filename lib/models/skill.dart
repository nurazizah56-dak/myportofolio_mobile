import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

double _scoreFromJson(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

double? _percentageFromJson(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

int _orderFromJson(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// Portfolio skill entry synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Skill {
  const Skill({
    this.id,
    required this.name,
    this.category = 'soft',
    required this.score,
    this.order = 0,
    this.percentage,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;

  final String name;

  @JsonKey(defaultValue: 'soft')
  final String category;

  @JsonKey(fromJson: _scoreFromJson)
  final double score;

  @JsonKey(defaultValue: 0, fromJson: _orderFromJson)
  final int order;

  @JsonKey(includeToJson: false, fromJson: _percentageFromJson)
  final double? percentage;

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
