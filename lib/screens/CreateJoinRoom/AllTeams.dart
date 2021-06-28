//import 'package:app1/screens/CreateJoinRoom/TeamDetails.dart';
import 'package:app1/screens/CreateJoinRoom/team_player.dart';
import 'package:flutter/material.dart';

import 'YourTeams.dart';

class AllTeams extends StatelessWidget {
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
                  tindex = teams[index];
                  Navigator.pushNamed(
                    context,
                    '/teamdetails',
                  );
                }))
      ]),
    );
  }

  //void selectteam(BuildContext context) {
  // Navigator.of(context).pushNamed(TeamDetails().routeName);
//  }

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
          child:  ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemCount: teams.length,
                itemBuilder: (BuildContext context, int index) {
                  return tiles(
                      name: teams[index].tname,
                      number: teams[index].adminphone,
                      context: context,
                      index: index);
                })
        ),
      )),
    );
  }
}
