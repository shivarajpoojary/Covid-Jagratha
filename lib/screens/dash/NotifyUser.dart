import 'dart:convert';
import 'package:findcovid_19/components/drawer.dart';
import 'package:findcovid_19/config/palette.dart';
import 'package:findcovid_19/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NotifyUser extends StatefulWidget {
  NotifyUser({Key key}) : super(key: key);

  @override
  _NotifyUserState createState() => _NotifyUserState();
}

class _NotifyUserState extends State<NotifyUser> {
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
    var url = "https://api.rootnet.in/covid19-in/notifications";
    var response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['data']['notifications'];
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
        title: Text("Notification"),
      ),
      drawer: DrawerCustom(),
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
    return Scrollbar(
      showTrackOnHover: true,
      isAlwaysShown: true,
      child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return getCard(users[index]);
          }),
    );
  }

  Widget getCard(item) {
    var title = item['title'];
    var link = item['link'];
    // var profileUrl = item['picture']['large'];
    return Card(
      color: Palette.primaryColor.withOpacity(1),
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 70,
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Text(
                        link.toString(),
                        style: TextStyle(
                          color: mDeathColor,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () => launch(link.toString()),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
