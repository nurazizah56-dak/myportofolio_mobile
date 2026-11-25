/// Portfolio education entry synchronized with the Django REST Framework API.
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

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json['id'] as String?,
        institutionName: json['institution_name'] as String,
        degree: json['degree'] as String,
        location: (json['location'] as String?) ?? '',
        mapsUrl: json['maps_url'] as String?,
        logo: json['logo'] as String?,
        startYear: json['start_year'] as int,
        endYear: json['end_year'] as int?,
        isOngoing: (json['is_ongoing'] as bool?) ?? false,
      );

  final String? id;
  final String institutionName;
  final String degree;
  final String location;
  final String? mapsUrl;
  final String? logo;
  final int startYear;
  final int? endYear;
  final bool isOngoing;

  Map<String, dynamic> toJson() => {
        'institution_name': institutionName,
        'degree': degree,
        'location': location,
        if (mapsUrl != null) 'maps_url': mapsUrl,
        if (logo != null) 'logo': logo,
        'start_year': startYear,
        if (endYear != null) 'end_year': endYear,
      };
}
