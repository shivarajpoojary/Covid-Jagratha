import 'package:findcovid_19/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:findcovid_19/utilities/constants.dart';
import 'package:findcovid_19/models/Districts.dart';

class DistrictPage extends StatefulWidget {
  DistrictPage({Key key, this.title, this.code}) : super(key: key);

  final String title;
  final String code;

  @override
  DistrictPageState createState() => new DistrictPageState();
}

class DistrictPageState extends State<DistrictPage> {
  final String apiUrl = "https://api.covid19india.org/state_district_wise.json";

  Future<Map<dynamic, dynamic>> fetchUsers(String title) async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)[title]['districtData'];
  }

  @override
  void initState() {
    super.initState();
    fetchUsers(widget.title);
    print(widget.title);
    print(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text(
      //     widget.title,
      //     style: kTextStyleAppBar,
      //     textAlign: TextAlign.justify,
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        brightness: Brightness.dark,
        elevation: 0.0,
        title: Text(
          widget.title,
          style: kTextStyleAppBar,
        ),
      ),
      body: Container(
        child: FutureBuilder<Map<dynamic, dynamic>>(
            future: fetchUsers(widget.title),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<String> l = getDistricts(widget.code);
                print(snapshot.data[l[0]]['active']);
                return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: l.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading:
                                Icon(Icons.show_chart, color: kColourPrimary),
                            title: Text(
                              '${(l[index])}',
                              style: kTextStyleDate,
                            ),
                            subtitle: Text(
                              "Confirmed :${(snapshot.data[(l[index])]['confirmed'].toString())}",
                              style: kData,
                            ),
                            trailing: SingleChildScrollView(
                              child: Column(children: <Widget>[
                                Text(
                                  " Active :${(snapshot.data[l[index]]['active'].toString())}",
                                  style: kDataActive,
                                ),
                                Text(
                                  " Deaths :${(snapshot.data[l[index]]['deceased'].toString())}",
                                  style: kDataDeath,
                                ),
                                Text(
                                  "Recovered :${(snapshot.data[l[index]]['recovered'].toString())}",
                                  style: kDataRecoverd,
                                ),
                              ]),
                            ),
                            isThreeLine: true,
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
