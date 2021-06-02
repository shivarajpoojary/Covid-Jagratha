import 'package:findcovid_19/config/size_config.dart';
import 'package:flutter/material.dart';

import 'components/welcome_landscape.dart';
import 'components/welcome_portriat.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).orientation == SizeConfig.orientation
          ? WelcomePortriatWidget()
          : WelcomeScreenLandscapeWidget(),
    );
  }
}
