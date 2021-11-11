import 'dart:convert';

import 'package:flutter_application_1/models/rawUSD_model.dart';

class Raw {
  Raw({
    required this.usd,
  });

  final RawUsd usd;

  factory Raw.fromJson(String str) => Raw.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Raw.fromMap(Map<String, dynamic> json) => Raw(
        usd: RawUsd.fromMap(json["USD"]),
      );

  Map<String, dynamic> toMap() => {
        "USD": usd.toMap(),
      };
}
