/// Portfolio experience entry synchronized with the Django REST Framework API.
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

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json['id'] as String?,
        title: json['title'] as String,
        description: json['description'] as String,
        category: json['category'] as String,
        categoryDisplay: (json['category_display'] as String?) ?? '',
        thumbnail: json['thumbnail'] as String?,
        startedAt: json['started_at'] != null
            ? DateTime.tryParse(json['started_at'] as String)
            : null,
        endedAt: json['ended_at'] != null
            ? DateTime.tryParse(json['ended_at'] as String)
            : null,
        isOngoing: (json['is_ongoing'] as bool?) ?? false,
      );

  final String? id;
  final String title;
  final String description;
  final String category;
  final String categoryDisplay;
  final String? thumbnail;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final bool isOngoing;

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'category': category.toLowerCase(),
        if (thumbnail != null && thumbnail!.isNotEmpty) 'thumbnail': thumbnail,
        if (endedAt != null) 'ended_at': endedAt!.toIso8601String(),
      };
}
