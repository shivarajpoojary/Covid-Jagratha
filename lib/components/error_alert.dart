import 'package:flutter/material.dart';
import 'package:findcovid_19/utilities/constants.dart';

class ErrorAlert extends StatelessWidget {
  final String errorMessage;
  final Function onRetryButtonPressed;

  ErrorAlert({
    @required this.errorMessage,
    @required this.onRetryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kColourAlertBackground,
      title: Text('Error', style: kTextStyleAlertTitle),
      content: Text(errorMessage, style: kTextStyleAlertText),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          padding: EdgeInsets.only(right: 18.0),
          child: Text('Retry', style: kTextStyleAlertButton),
          onPressed: onRetryButtonPressed,
        ),
      ],
    );
  }
}
