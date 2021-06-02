import 'package:findcovid_19/components/drawer.dart';
import 'package:findcovid_19/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:findcovid_19/utilities/constants.dart';

class UserList extends StatelessWidget {
  final String apiUrl = "https://api.covid19india.org/data.json";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['statewise'];
  }

  String _name(dynamic user) {
    return user['state'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        brightness: Brightness.dark,
        elevation: 0.0,
        title: Text(
          'India',
          style: kTextStyleAppBar,
        ),
      ),
      drawer: DrawerCustom(),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading:
                                Icon(Icons.show_chart, color: kColourPrimary),
                            title: Text(
                              _name(snapshot.data[index]),
                              style: kTextStyleDate,
                            ),
                            subtitle: Text(
                              "Confirmed :${(snapshot.data[index]['confirmed'].toString())}",
                              style: kData,
                            ),
                            trailing: SingleChildScrollView(
                              child: Column(children: <Widget>[
                                Text(
                                  " Active :${(snapshot.data[index]['active'].toString())}",
                                  style: kDataActive,
                                ),
                                Text(
                                  " Deaths :${(snapshot.data[index]['deaths'].toString())}",
                                  style: kDataDeath,
                                ),
                                Text(
                                  " Recovered :${(snapshot.data[index]['recovered'].toString())}",
                                  style: kDataRecoverd,
                                ),
                              ]),
                            ),
                            isThreeLine: true,
                            // onTap: () {
                            //   index == 0
                            //       ? print("Unclickable")
                            //       : Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => DistrictPage(
                            //               title:
                            //                   '${_name(snapshot.data[index])}',
                            //               code: snapshot.data[index]
                            //                       ['statecode']
                            //                   .toString(),
                            //             ),
                            //           ),
                            //         );
                            //   print(_name(snapshot.data[index]));
                            //   print(snapshot.data[index]['statecode']);
                            // },
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
