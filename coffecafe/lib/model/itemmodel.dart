import 'dart:convert';

List<Item> itemModelFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemModelToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    required this.id,
    required this.name,
    required this.rate,
  });

  int id;
  String name;
  int rate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        rate: json["rate"],
      );

  set quantity(int quantity) {}

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rate": rate,
      };
}