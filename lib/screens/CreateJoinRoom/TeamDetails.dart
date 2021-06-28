import 'package:app1/screens/CreateJoinRoom/YourTeams.dart';
import 'package:app1/screens/CreateJoinRoom/team_player.dart';
import 'package:app1/screens/Loginpage/login.dart';
import 'package:app1/services/rtDatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TeamDetails extends StatefulWidget {
  @override
  _TeamDetailsState createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  Team team = tindex; //Team(
  //     adminname: "sreeni",
  //     adminphone: "979971",
  //     tname: "babus",
  //     location: "Chennai",
  //     email: "aa@hmail.com");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        actions: [
          (tindex.useremail == useremail)
              ? IconButton(
                  onPressed: () {
                    AlertDialog alert = AlertDialog(
                      title: Text("Delete Your Team"),
                      content:
                          Text("Are You Sure You Want To Delete This Team?"),
                      actions: [
                        TextButton(
                          child: Text("No"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text("Yes"),
                          onPressed: () async {
                            deleteTeam(tindex);
                            setState(() {
                              getTeam();
                              filterUserTeams();
                            });
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  icon: Icon(Icons.delete))
              : Text("")
        ],
        shadowColor: Colors.grey.shade700,
        foregroundColor: Colors.grey.shade700,
        backgroundColor: Colors.grey.shade700,
        centerTitle: true,
        title: Text("Team Details"),
      ),
      body:
          ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
        Container(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //    mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${team.tname} ",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.amber.shade700,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "\nID: test -260421-3 ",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                                "Total Players: ${team.players.length} \nAdmin Name: ${team.adminname} \nTeam Email:${team.email}\nTeam Location: ${team.location}\nAdmin Contacts: ${team.adminphone}",
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "    Team Players",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Container(
                  // padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: Column(children: <Widget>[
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10),
                        itemCount: team.players.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(13),
                            leading: Icon(
                              Icons.person_outline,
                              color: Colors.red.shade300,
                              size: 50,
                            ),
                            title: Text(
                              "${team.players[index].name}" +
                                  ((team.players[index].isAdmin == true)
                                      ? " (Admin)"
                                      : "") +
                                  ((team.players[index].isCap == true)
                                      ? " (C)"
                                      : ""),
                            ),
                            subtitle: Text(
                                "\nPlayer Type:${team.players[index].playertype}  \nContacts: ${team.players[index].phone}"),
                          );
                        })
                  ]),
                ),
              )
            ],
          )),
        ),
      ]),
    );
  }
}
