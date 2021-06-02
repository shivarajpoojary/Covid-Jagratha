// ignore: unused_import
import 'package:charts_flutter/flutter.dart';
import 'package:findcovid_19/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:findcovid_19/components/stats_row.dart';

class Stats extends StatelessWidget {
  final int sickNumber;
  final int recoveredNumber;
  final int deadNumber;
  final double sickPercentage;
  final double recoveredPercentage;
  final double deadPercentage;

  Stats({
    @required this.sickNumber,
    @required this.recoveredNumber,
    @required this.deadNumber,
    @required this.sickPercentage,
    @required this.recoveredPercentage,
    @required this.deadPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StatsRow(
              colour: kConfirmedColor,
              label: 'Sick',
              number: sickNumber,
              percentage: sickPercentage,
            ),
            StatsRow(
              colour: mRecoveredColor,
              label: 'Recovered',
              number: recoveredNumber,
              percentage: recoveredPercentage,
            ),
            StatsRow(
              colour: kDeathColor,
              label: 'Dead',
              number: deadNumber,
              percentage: deadPercentage,
            ),
          ],
        ),
      ),
    );
  }
}
