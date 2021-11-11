import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_View(),
    );
  }
}

class Home_View extends StatelessWidget {
  const Home_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coins++'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          Coins newCoins =
              Coins.fromJson('https://min-api.cryptocompare.com/data/top/totalvolfull?tsym=USD');
          return ListTile(
            title: Text(newCoins.name), //!title
            subtitle: Text(newCoins.id), //!ID
            trailing: Text(newCoins.rawPrice.toString()), //!raw PRICE
          );
        },
      ),
    );
  }
}

class Coins {
  String name;
  String id;
  double rawPrice;
  Coins({
    required this.name,
    required this.id,
    required this.rawPrice,
  });

  Coins copyWith({
    String? name,
    String? id,
    double? rawPrice,
  }) {
    return Coins(
      name: name ?? this.name,
      id: id ?? this.id,
      rawPrice: rawPrice ?? this.rawPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'rawPrice': rawPrice,
    };
  }

  factory Coins.fromMap(Map<String, dynamic> map) {
    return Coins(
      name: map['name'],
      id: map['id'],
      rawPrice: map['rawPrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Coins.fromJson(String source) => Coins.fromMap(json.decode(source));

  @override
  String toString() => 'Coins(name: $name, id: $id, rawPrice: $rawPrice)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coins && other.name == name && other.id == id && other.rawPrice == rawPrice;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ rawPrice.hashCode;
}
