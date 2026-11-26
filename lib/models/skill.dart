import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

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

  final double score;

  @JsonKey(defaultValue: 0)
  final int order;

  @JsonKey(includeToJson: false)
  final double? percentage;

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
