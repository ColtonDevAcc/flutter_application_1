import 'dart:convert';

class RawUsd {
  final double price;
  final double volumeday;
  final double volumedayto;
  final double volume24Hour;
  final double volume24Hourto;
  final double openday;
  final double highday;
  final double supply;
  final double mktcap;
  final int mktcappenalty;
  final double circulatingsupply;
  final double circulatingsupplymktcap;
  final String imageurl;
  RawUsd({
    required this.price,
    required this.volumeday,
    required this.volumedayto,
    required this.volume24Hour,
    required this.volume24Hourto,
    required this.openday,
    required this.highday,
    required this.supply,
    required this.mktcap,
    required this.mktcappenalty,
    required this.circulatingsupply,
    required this.circulatingsupplymktcap,
    required this.imageurl,
  });

  factory RawUsd.fromJson(String str) => RawUsd.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RawUsd.fromMap(Map<String, dynamic> json) => RawUsd(
        price: json["PRICE"].toDouble(),
        volumeday: json["VOLUMEDAY"].toDouble(),
        volumedayto: json["VOLUMEDAYTO"].toDouble(),
        volume24Hour: json["VOLUME24HOUR"].toDouble(),
        volume24Hourto: json["VOLUME24HOURTO"].toDouble(),
        openday: json["OPENDAY"].toDouble(),
        highday: json["HIGHDAY"].toDouble(),
        supply: json["SUPPLY"].toDouble(),
        mktcap: json["MKTCAP"].toDouble(),
        mktcappenalty: json["MKTCAPPENALTY"],
        circulatingsupply: json["CIRCULATINGSUPPLY"].toDouble(),
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"].toDouble(),
        imageurl: json["IMAGEURL"],
      );

  Map<String, dynamic> toMap() => {
        "PRICE": price,
        "VOLUMEDAY": volumeday,
        "VOLUMEDAYTO": volumedayto,
        "VOLUME24HOUR": volume24Hour,
        "VOLUME24HOURTO": volume24Hourto,
        "OPENDAY": openday,
        "HIGHDAY": highday,
        "SUPPLY": supply,
        "MKTCAP": mktcap,
        "MKTCAPPENALTY": mktcappenalty,
        "CIRCULATINGSUPPLY": circulatingsupply,
        "CIRCULATINGSUPPLYMKTCAP": circulatingsupplymktcap,
        "IMAGEURL": imageurl,
      };
}
