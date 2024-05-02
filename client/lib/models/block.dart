class Block {
  int id;
  String title;
  int studentCount;
  int cardCount;
  String iconUrl;
  String description;

  Block({
    required this.id,
    required this.title,
    required this.studentCount,
    required this.cardCount,
    required this.iconUrl,
    required this.description,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      id: json['id'],
      title: json['title'],
      studentCount: json['studentCount'],
      cardCount: json['cardCount'],
      iconUrl: json['iconUrl'],
      description: json['description'],
    );
  }
}
