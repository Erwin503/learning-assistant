import 'dart:convert';

BlockCard blockCardFromJson(String str) => BlockCard.fromJson(json.decode(str));

String blockCardToJson(BlockCard data) => json.encode(data.toJson());

class BlockCard {
  int id;
  String text;
  String icon;
  String translation;
  int blockId;
  DateTime updatedAt;
  DateTime createdAt;

  BlockCard({
    required this.id,
    required this.text,
    required this.icon,
    required this.translation,
    required this.blockId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory BlockCard.fromJson(Map<String, dynamic> json) => BlockCard(
        id: json["id"],
        text: json["text"],
        icon: json["icon"],
        translation: json["translation"],
        blockId: json["blockId"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "icon": icon,
        "translation": translation,
        "blockId": blockId,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
