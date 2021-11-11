import 'dart:convert';

import 'package:flutter_application_1/models/datum_model.dart';
import 'package:flutter_application_1/models/metadata_model.dart';
import 'package:flutter_application_1/models/rawUSD_model.dart';

class Welcome {
  Welcome({
    required this.message,
    required this.type,
    required this.metaData,
    required this.data,
    required this.hasWarning,
  });

  final String message;
  final int type;
  final bool hasWarning;
  final List<Datum> data;

  final MetaData metaData;

  factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        message: json["Message"],
        type: json["Type"],
        metaData: MetaData.fromMap(json["MetaData"]),
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromMap(x))),
        hasWarning: json["HasWarning"],
      );

  Map<String, dynamic> toMap() => {
        "Message": message,
        "Type": type,
        "MetaData": metaData.toMap(),
        "Data": List<dynamic>.from(data.map((x) => x.toMap())),
        "HasWarning": hasWarning,
      };
}
