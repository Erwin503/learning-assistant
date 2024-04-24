import 'dart:convert';

BlockCategory BlockCategoryFromJson(String str) =>
    BlockCategory.fromJson(json.decode(str));

String BlockCategoryToJson(BlockCategory data) => json.encode(data.toJson());

class BlockCategory {
  int id;
  String name;
  String icon;
  DateTime updatedAt;
  DateTime createdAt;

  BlockCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.updatedAt,
    required this.createdAt,
  });

  factory BlockCategory.fromJson(Map<String, dynamic> json) => BlockCategory(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
