//import 'package:app1/screens/CreateJoinRoom/TeamDetails.dart';
import 'package:flutter/material.dart';

class AllTeams extends StatelessWidget {
  ListTile tiles(
      {required String name,
      required String number,
      required IconData icon2,
      required Function() onTap}) {
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
                icon: new Icon(icon2), iconSize: 35, onPressed: () {}))
      ]),
    );
  }

  //void selectteam(BuildContext context) {
  // Navigator.of(context).pushNamed(TeamDetails().routeName);
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          tiles(
            name: 'test',
            number: 'ID:test-260421-3',
            icon2: Icons.chevron_right,
            onTap: () {
              Navigator.pushNamed(context, '/TeamDetails');
            },
          ),
          tiles(
            name: 'test',
            number: 'ID:test-260421-4',
            icon2: Icons.chevron_right,
            onTap: () {
              Navigator.pushNamed(context, '/TeamDetails');
            },
          ),
        ]),
      ),
    ));
  }
}
