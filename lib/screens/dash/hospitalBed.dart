import 'dart:convert';

import 'package:findcovid_19/config/palette.dart';
import 'package:findcovid_19/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HospitalBeds extends StatefulWidget {
  HospitalBeds({Key key}) : super(key: key);

  @override
  _HospitalBedsState createState() => _HospitalBedsState();
}

class _HospitalBedsState extends State<HospitalBeds> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://api.rootnet.in/covid19-in/hospitals/beds";
    var response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['data']['regional'];
      print(items);
      setState(() {
        users = items;
        print(users.length);
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        brightness: Brightness.dark,
        elevation: 0.0,
        title: Text("Hospitals & beds"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (users.contains(null) || users.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      ));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    var state = item['state'];
    var ruralHospitals = item['ruralHospitals'];
    var ruralBeds = item['ruralBeds'];
    var totalHospitals = item['totalHospitals'];
    var totalBeds = item['totalBeds'];
    var urbanHospitals = item['urbanHospitals'];
    var urbanBeds = item['urbanBeds'];
    // var profileUrl = item['picture']['large'];
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.medical_services_sharp, color: kColourPrimary),
            title: Text(
              state,
              style: kTextStyleDate,
            ),
            subtitle: Text(
              "Total Hospital :${(totalHospitals)}",
              style: kData,
            ),
            trailing: SingleChildScrollView(
              child: Column(children: <Widget>[
                Text(
                  " Total Beds :${(totalBeds)}",
                  style: kData,
                ),
                Text(
                  " Rural Hospitals :${(ruralHospitals)}",
                  style: kData,
                ),
                Text(
                  "Rural Beds :${(ruralBeds)}",
                  style: kData,
                ),
                Text(
                  "Urban Hospitals :${(urbanHospitals)}",
                  style: kData,
                ),
                Text(
                  "Urban Beds :${(urbanBeds)}",
                  style: kData,
                )
              ]),
            ),
            isThreeLine: true,
          )
        ],
      ),
    );
  }
}
