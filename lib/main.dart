import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/coinInfo_model.dart';
import 'package:flutter_application_1/models/rawUSD_model.dart';
import 'package:flutter_application_1/models/raw_model.dart';
import 'package:flutter_application_1/models/welcome_model.dart';
import 'package:flutter_application_1/views/coinInfo_view.dart';
import 'package:http/http.dart' as http;

import 'models/datum_model.dart';

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
      body: FutureBuilder(
        future: loadCoinData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoinInfo_View(
                            coinInfo: snapshot.data[0][index],
                            raw: snapshot.data[1][index],
                            rawUSD: snapshot.data[2][index],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      //[coinInfoList, rawInfoList, rawUSDInfoList]
                      title: Text(snapshot.data[0][index].name),
                      subtitle: Text('id: ${snapshot.data[0][index].id}'),
                      trailing: Text('${snapshot.data[2][index].price}'),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future<List<dynamic>> loadCoinData() async {
  var response =
      await http.get(Uri.parse('https://min-api.cryptocompare.com/data/top/totalvolfull?tsym=USD'));
  List<Datum> datum = Welcome.fromJson(response.body).data;

  List coinInfoList = [];
  List rawInfoList = [];
  List rawUSDInfoList = [];

  datum.forEach((element) {
    coinInfoList.add(element.coinInfo);
    rawInfoList.add(element.raw);
    rawUSDInfoList.add(element.raw.usd);
  });

  return [coinInfoList, rawInfoList, rawUSDInfoList];
}
