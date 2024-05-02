import 'dart:convert';

Group groupFromJson(String str) => Group.fromJson(json.decode(str));

String groupToJson(Group data) => json.encode(data.toJson());

class Group {
  int id;
  String name;
  int ownerId;
  int studentCount;

  Group({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.studentCount,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        ownerId: json["ownerId"],
        studentCount: json["studentCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ownerId": ownerId,
        "studentCount": studentCount,
      };
}
