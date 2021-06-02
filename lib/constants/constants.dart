import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF166DE0);
Color kConfirmedColor = Color(0xFFFF1242);
Color kActiveColor = Color(0xFF017BFF);
Color kRecoveredColor = Color(0xFF29A746);
Color kDeathColor = Color(0xFF6D757D);
Color mBackgroundColor = Color(0xFF473F97);

Color mLightBackgroundColor = Color(0xFFAEA1E5);

Color mTitleColor = Color(0xFF0D1333);

Color mRedButtonColor = Color(0xFFFF4D58);

Color mBlueButtonColor = Color(0xFF4D79FF);

Color mIconColor = Color(0xFF999FBF);

Color mAffectedColor = Color(0xFFFFB259);
Color mDeathColor = Color(0xFFFF5959);
Color mRecoveredColor = Color(0xFF4CD97B);
Color mActiveColor = Color(0xFF4DB5FF);
Color mSeriousColor = Color(0xFF9059FF);
// final kInnerDecoration = BoxDecoration(
//   color: Colors.transparent,
//   border: Border.all(color: Colors.white),
//   borderRadius: BorderRadius.circular(32),
// );

// final kGradientBoxDecoration = BoxDecoration(
//   gradient: LinearGradient(colors: [Colors.transparent, Colors.color]),
//   border: Border.all(
//     color: Colors.transparent,
//   ),
//   borderRadius: BorderRadius.circular(32),
// );

Color mChartColor = Color(0xFFFF5959);

LinearGradient kGradientShimmer = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.grey[300],
    Colors.grey[100],
  ],
  // colors: [],
);

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]}.';
