import 'package:findcovid_19/components/frequentquestions.dart';
import 'package:findcovid_19/config/palette.dart';
import 'package:findcovid_19/screens/dash/helpline.dart';
import 'package:findcovid_19/screens/dash/hospitalBed.dart';
import 'package:findcovid_19/screens/onboarding/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({Key key, ListView child}) : super(key: key);

  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  final _auth = FirebaseAuth.instance;
  var user = FirebaseAuth.instance.currentUser.phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("images/color.jpg"),
              ),
            ),
            child: Stack(children: <Widget>[
              Positioned(
                bottom: 40.0,
                left: 14.0,
                child: Text(
                  "Welcome, am Shivaraj",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.contact_phone,
                  color: Palette.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Helpline Number",
                    style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpLine()),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.call,
                  color: Palette.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Call Helpline(1075)",
                    style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
            onTap: () async {
              const url = 'tel:1075';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.medical_services,
                  color: Palette.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Hospitals & beds",
                    style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HospitalBeds()),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.question_answer,
                  color: Palette.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "FAQ",
                    style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQ()),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.details_sharp,
                  color: Palette.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "About",
                    style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: Image.asset(
                  "images/coronavirus.png",
                  height: 50,
                  width: 50,
                ),
                applicationName: 'Covid Jagratha',
                applicationVersion: '0.0.1',
                applicationLegalese: '©2021 Covid Jagratha.com',
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.logout,
                  color: Palette.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
            onTap: () async {
              await _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()));
            },
          ),
        ],
      ),
    );
  }
}
