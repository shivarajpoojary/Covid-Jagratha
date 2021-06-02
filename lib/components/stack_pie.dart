import 'package:findcovid_19/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:findcovid_19/utilities/constants.dart';
import 'package:fl_chart/fl_chart.dart';

class StackPie extends StatelessWidget {
  final int totalNumber;
  final int sickNumber;
  final int recoveredNumber;
  final int deadNumber;

  final double radius = 50;
  final bool showTitles = false;

  StackPie({
    @required this.totalNumber,
    @required this.sickNumber,
    @required this.recoveredNumber,
    @required this.deadNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, -0.05),
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('Total:', style: kTextStyleTotalLabel),
            SizedBox(height: 12),
            Text(
              kNumberFormat.format(totalNumber),
              style: kTextStyleTotalNumber,
            ),
          ],
        ),
        PieChart(
          PieChartData(
            startDegreeOffset: -90,
            borderData: FlBorderData(show: false),
            sections: [
              PieChartSectionData(
                value: sickNumber.toDouble(),
                color: kConfirmedColor,
                radius: radius,
                showTitle: showTitles,
              ),
              PieChartSectionData(
                value: recoveredNumber.toDouble(),
                color: mRecoveredColor,
                radius: radius,
                showTitle: showTitles,
              ),
              PieChartSectionData(
                value: deadNumber.toDouble(),
                color: kDeathColor,
                radius: radius,
                showTitle: showTitles,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
