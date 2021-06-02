import 'package:flutter/material.dart';
import 'package:findcovid_19/constants/constants.dart';

class NavigationOption extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onSelected;

  NavigationOption(
      {@required this.title,
      @required this.selected,
      @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // height: 40.0,
              // width: 100,
              // color: Colors.white,
              decoration: BoxDecoration(
                border: Border.all(color: mTitleColor, width: 1),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                      color: mAffectedColor),
                  // color: Colors.white,
                  width: 140,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: selected ? kPrimaryColor : Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            selected
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 20,
                        height: 8,
                        decoration: BoxDecoration(
                          color: mRedButtonColor,
                          borderRadius: BorderRadius.circular(10.0),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
