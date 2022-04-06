import 'dart:convert';

List<WallModel> romModelFromJson(String str) =>
    List<WallModel>.from(json.decode(str).map((x) => WallModel.fromJson(x)));
String romModelToJson(List<WallModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WallModel {
  String? name;
  String? category;
  String? url;

  WallModel({
    this.name,
    this.category,
    this.url,
  });

  factory WallModel.fromJson(Map<String, dynamic> json) => WallModel(
        name: json["name"],
        category: json["category"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "category": category,
      };

}
