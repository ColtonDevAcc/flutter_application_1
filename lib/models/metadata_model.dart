import 'dart:convert';

class MetaData {
  MetaData({
    required this.count,
  });

  final int count;

  factory MetaData.fromJson(String str) => MetaData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetaData.fromMap(Map<String, dynamic> json) => MetaData(
        count: json["Count"],
      );

  Map<String, dynamic> toMap() => {
        "Count": count,
      };
}
