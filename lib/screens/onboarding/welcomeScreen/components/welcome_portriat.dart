import 'package:findcovid_19/config/size_config.dart';
import 'package:findcovid_19/screens/onboarding/welcomeScreen/components/welcome_buttons_container.dart';
import 'package:findcovid_19/screens/onboarding/welcomeScreen/components/welcome_text_container.dart';
import 'package:findcovid_19/screens/onboarding/welcomeScreen/components/welome_dish_image.dart';
import 'package:flutter/material.dart';

class WelcomePortriatWidget extends StatelessWidget {
  const WelcomePortriatWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WelcomeDishImageWidget(),
        WelcomeTextContainer(),
        SizedBox(
          height: SizeConfig.defaultSize * 5,
        ),
        WelcomeButtonContainer(),
        Spacer()
      ],
    );
  }
}
