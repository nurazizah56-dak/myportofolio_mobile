/// Portfolio project synchronized with the Django REST Framework API.
class Project {
  const Project({
    this.id,
    required this.title,
    required this.description,
    required this.techStack,
    required this.projectUrl,
    this.projectImageUrl = '',
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json['id'] as String?,
        title: json['title'] as String,
        description: json['description'] as String,
        techStack: json['tech_stack'] as String,
        projectUrl: json['project_url'] as String,
        projectImageUrl: (json['project_image_url'] as String?) ?? '',
      );

  final String? id;
  final String title;
  final String description;
  final String techStack;
  final String projectUrl;
  final String projectImageUrl;

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'tech_stack': techStack,
        'project_url': projectUrl,
        'project_image_url': projectImageUrl,
      };
}
