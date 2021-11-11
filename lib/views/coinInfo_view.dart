import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/coinInfo_model.dart';
import 'package:flutter_application_1/models/rawUSD_model.dart';
import 'package:flutter_application_1/models/raw_model.dart';

class CoinInfo_View extends StatelessWidget {
  final Raw raw;
  final RawUsd rawUSD;
  final CoinInfo coinInfo;
  const CoinInfo_View({Key? key, required this.raw, required this.rawUSD, required this.coinInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinInfo.name),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'algorithm: ${coinInfo.algorithm}',
                textScaleFactor: 1.1,
              ),
              Text(
                'assetLaunchDate: ${coinInfo.assetLaunchDate.year}',
                textScaleFactor: 1.1,
              ),
              Text(
                'fullName: ${coinInfo.fullName}',
                textScaleFactor: 1.1,
              ),
              Text(
                'maxSupply: ${coinInfo.maxSupply}',
                textScaleFactor: 1.1,
              ),
              Text(
                'netHashesPerSecond: ${coinInfo.netHashesPerSecond}',
                textScaleFactor: 1,
              ),
              Text(
                'market cap: ${rawUSD.mktcap}',
                textScaleFactor: 1.1,
              ),
              Text(
                'volume24Hour: ${rawUSD.volume24Hour}',
                textScaleFactor: 1.1,
              ),
              Text(
                'openday: ${rawUSD.openday}',
                textScaleFactor: 1.1,
              ),
              Text(
                'circulatingsupply: ${rawUSD.circulatingsupply}',
                textScaleFactor: 1.1,
              ),
              Text(
                'highday: ${rawUSD.highday}',
                textScaleFactor: 1.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
