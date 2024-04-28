class Course {
  int id;
  String title;
  int studentCount;
  int cardCount;
  String iconUrl;
  String description;

  Course({
    required this.id,
    required this.title,
    required this.studentCount,
    required this.cardCount,
    required this.iconUrl,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'],
      id: json['id'],
      studentCount: json['student_count'],
      cardCount: json['card_count'],
      description: json['description'],
      iconUrl: json['icon_url'],
    );
  }
  @override
  String toString() {
    return 'Course(id: $id, title: "$title", studentCount: $studentCount, cardCount: $cardCount, iconUrl: "$iconUrl", description: "$description")';
  }
}
