import 'package:findcovid_19/config/size_config.dart';
import 'package:findcovid_19/constants/color.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              'Skip',
              style: TextStyle(
                  fontSize: SizeConfig.defaultSize * 1.4, //14
                  color: kDefaultAppColor,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
