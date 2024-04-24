class Course {
  final String title;
  final int studentCount;
  final int cardCount;
  final String iconUrl;
  final String description;

  Course({
    required this.title,
    required this.studentCount,
    required this.cardCount,
    required this.iconUrl,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'],
      studentCount: json['student_count'],
      cardCount: json['card_count'],
      description: json['description'],
      iconUrl: json['icon_url'],
    );
  }
}
