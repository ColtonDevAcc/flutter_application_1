import 'dart:convert';

import 'package:flutter_application_1/models/welcome_model.dart';

class CoinInfo {
  CoinInfo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.imageUrl,
    required this.algorithm,
    required this.netHashesPerSecond,
    required this.assetLaunchDate,
    required this.maxSupply,
  });

  final String id;
  final String name;
  final String fullName;
  final String imageUrl;
  final String algorithm;
  final double netHashesPerSecond;
  final DateTime assetLaunchDate;
  final double maxSupply;

  factory CoinInfo.fromJson(String str) => CoinInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoinInfo.fromMap(Map<String, dynamic> json) => CoinInfo(
        id: json["Id"],
        name: json["Name"],
        fullName: json["FullName"],
        imageUrl: json["ImageUrl"],
        algorithm: json["Algorithm"],
        netHashesPerSecond: json["NetHashesPerSecond"].toDouble(),
        assetLaunchDate: DateTime.parse(json["AssetLaunchDate"]),
        maxSupply: json["MaxSupply"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "Id": id,
        "Name": name,
        "FullName": fullName,
        "ImageUrl": imageUrl,
        "Algorithm": algorithm,
        "NetHashesPerSecond": netHashesPerSecond,
        "AssetLaunchDate":
            "${assetLaunchDate.year.toString().padLeft(4, '0')}-${assetLaunchDate.month.toString().padLeft(2, '0')}-${assetLaunchDate.day.toString().padLeft(2, '0')}",
        "MaxSupply": maxSupply,
      };
}
