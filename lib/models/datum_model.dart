import 'dart:convert';

import 'package:flutter_application_1/models/raw_model.dart';

import 'coinInfo_model.dart';

class Datum {
  Datum({
    required this.coinInfo,
    required this.raw,
  });

  final CoinInfo coinInfo;
  final Raw raw;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        coinInfo: CoinInfo.fromMap(json["CoinInfo"]),
        raw: Raw.fromMap(json["RAW"]),
      );

  Map<String, dynamic> toMap() => {
        "CoinInfo": coinInfo.toMap(),
        "RAW": raw.toMap(),
      };
}
