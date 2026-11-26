/// Portfolio skill entry synchronized with the Django REST Framework API.
class Skill {
  const Skill({
    this.id,
    required this.name,
    required this.category,
    required this.score,
    this.order = 0,
    this.percentage,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json['id'] as String?,
        name: json['name'] as String,
        category: (json['category'] as String?) ?? 'soft',
        score: (json['score'] is num)
            ? (json['score'] as num).toDouble()
            : double.tryParse(json['score'].toString()) ?? 0.0,
        order: (json['order'] as int?) ?? 0,
        percentage: (json['percentage'] is num)
            ? (json['percentage'] as num).toDouble()
            : null,
      );

  final String? id;
  final String name;
  final String category;
  final double score;
  final int order;
  final double? percentage;

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category.toLowerCase(),
        'score': score,
        'order': order,
      };
}
