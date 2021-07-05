//import 'package:app1/screens/CreateJoinRoom/TeamDetails.dart';
import 'package:app1/screens/CreateJoinRoom/team_player.dart';
import 'package:app1/screens/Loginpage/login.dart';
import 'package:app1/services/rtDatabase.dart';
import 'package:flutter/material.dart';

List teams = [];
var tindex = null;
List<Team> userteams = [], nonUserTeams = [];

void filterUserTeams() {
  List<Team> a = [], b = [];
  for (var i = 0; i < teams.length; i++) {
    var item = teams[i];
    if (item.useremail == useremail) {
      a.add(item);
    } else {
      b.add(item);
    }
  }
  userteams = a;
  nonUserTeams = b;
  print(nonUserTeams);
}

class YourTeams extends StatefulWidget {
  @override
  _YourTeamsState createState() => _YourTeamsState();
}

class _YourTeamsState extends State<YourTeams> {
  @override
  void initState() {
    super.initState();
    setState(() {
      getTeam();
      filterUserTeams();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Container(
          alignment: Alignment.topLeft,
          height: 582,
          width: 340,
          child: Column(children: <Widget>[
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemCount: userteams.length,
                itemBuilder: (BuildContext context, int index) {
                  return tiles(
                      name: userteams[index].tname,
                      number: userteams[index].adminphone,
                      context: context,
                      index: index);
                }),
          ]),
        ),
      )),
    );
  }

  ListTile tiles(
      {required String name,
      required String number,
      required int index,
      required BuildContext context}) {
    return ListTile(
      leading: Icon(
        Icons.people,
        size: 50,
      ),
      title: Text(
        name,
      ),
      subtitle: Text(number),
      trailing: new Column(children: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: new IconButton(
                icon: new Icon(Icons.chevron_right),
                iconSize: 35,
                onPressed: () {
                  tindex = (userteams[index]);
                  Navigator.pushReplacementNamed(
                    context,
                    '/teamdetails',
                  );
                }))
      ]),
    );
  }
}
