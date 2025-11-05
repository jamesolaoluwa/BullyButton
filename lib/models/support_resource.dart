/// Model for support resources
class SupportResource {
  final String title;
  final String description;
  final String icon; // Emoji icon
  final List<String> bulletPoints;
  final String? link;
  
  SupportResource({
    required this.title,
    required this.description,
    required this.icon,
    required this.bulletPoints,
    this.link,
  });
}

