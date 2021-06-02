import 'package:flutter/material.dart';
import 'package:findcovid_19/components/color_box.dart';
import 'package:findcovid_19/utilities/constants.dart';

class StatsRow extends StatelessWidget {
  final Color colour;
  final String label;
  final int number;
  final double percentage;

  StatsRow({
    @required this.colour,
    @required this.label,
    @required this.number,
    @required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ColourBox(colour: colour),
          Text('$label:', style: kTextStyleStats),
          SizedBox(width: 4),
          Text('${kNumberFormat.format(number)}', style: kTextStyleStats),
          SizedBox(width: 4),
          Text('(${percentage.toStringAsFixed(2)}%)', style: kTextStyleStats),
        ],
      ),
    );
  }
}
