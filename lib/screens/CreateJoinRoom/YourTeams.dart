//import 'package:app1/screens/CreateJoinRoom/TeamDetails.dart';
import 'package:app1/screens/CreateJoinRoom/TeamDetails.dart';
import 'package:flutter/material.dart';

class YourTeams extends StatelessWidget {
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
            number: 'ID:test-260421-3 \n1 Players Joined',
            icon2: Icons.chevron_right,
            context: context,
          ),
          Padding(padding: EdgeInsets.all(10)),
          tiles(
            name: 'test',
            number: 'ID:test-260421-4 \n1 Players Joined',
            icon2: Icons.chevron_right,
            context: context,
          ),
        ]),
      ),
    ));
  }

  ListTile tiles(
      {required String name,
      required String number,
      required IconData icon2,
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
                icon: new Icon(icon2),
                iconSize: 35,
                onPressed: () {
                  Navigator.pushNamed(context, '/teamdetails');
                }))
      ]),
    );
  }
}
