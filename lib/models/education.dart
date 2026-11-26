import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

/// Portfolio education entry synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Education {
  const Education({
    this.id,
    required this.institutionName,
    required this.degree,
    this.location = '',
    this.mapsUrl,
    this.logo,
    required this.startYear,
    this.endYear,
    this.isOngoing = false,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;

  final String institutionName;
  final String degree;

  @JsonKey(defaultValue: '')
  final String location;

  final String? mapsUrl;
  final String? logo;
  final int startYear;
  final int? endYear;

  @JsonKey(includeToJson: false, defaultValue: false)
  final bool isOngoing;

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
