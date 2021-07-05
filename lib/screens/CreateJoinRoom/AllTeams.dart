//import 'package:app1/screens/CreateJoinRoom/TeamDetails.dart';
import 'package:app1/screens/CreateJoinRoom/team_player.dart';
import 'package:app1/services/rtDatabase.dart';
import 'package:flutter/material.dart';

import 'YourTeams.dart';

class AllTeams extends StatefulWidget {
  @override
  _AllTeamsState createState() => _AllTeamsState();
}

class _AllTeamsState extends State<AllTeams> {
  @override
  void initState() {
    super.initState();
    setState(() {
      getTeam();
      filterUserTeams();
    });
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
                  tindex = nonUserTeams[index];
                  Navigator.pushNamed(
                    context,
                    '/teamdetails',
                  );
                }))
      ]),
    );
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
            child: (nonUserTeams.length!=0)?ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemCount: nonUserTeams.length,
                itemBuilder: (BuildContext context, int index) {
                  return tiles(
                      name: nonUserTeams[index].tname,
                      number: nonUserTeams[index].adminphone,
                      context: context,
                      index: index);
                }):Text("Sorry! There are no Teams Available")),
      )),
    );
  }
}
