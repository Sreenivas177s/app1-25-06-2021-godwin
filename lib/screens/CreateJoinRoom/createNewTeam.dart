import 'dart:convert';

import 'package:app1/main.dart';
import 'package:app1/screens/CreateJoinRoom/YourTeams.dart';
import 'package:app1/screens/CreateJoinRoom/team_player.dart';
import 'package:app1/screens/Loginpage/login.dart';
import 'package:app1/services/rtDatabase.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


class CreateTeam extends StatefulWidget {
  const CreateTeam({Key? key}) : super(key: key);

  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  var prefs;
  String tname = "", adminname = "", email = "", location = "", adminphone = "";
  late String name;
  bool isAdmin = false, isCap = false;
  String playertype = "";
  String phone = "";
  List<Player> players = [];

  Player createplayer(
      String name, bool isAdmin, bool isCap, String playertype, String phone) {
    return Player(
        name: name,
        playertype: playertype,
        isAdmin: isAdmin,
        isCap: isCap,
        phone: phone);
  }
  

  void notification(){
 
  }
  @override
  Widget build(BuildContext context) {
    var l = context.read<PLayerList>();
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            AlertDialog alert = AlertDialog(
              title: Text("Finalize New Team"),
              content: Text("Are You Sure You Want To Create This Team?"),
              actions: [
                TextButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text("Yes"),
                  onPressed: () {
                    Team savedTeam = Team(
                        useremail: useremail,
                        adminname: adminname,
                        tname: tname,
                        email: email,
                        location: location,
                        adminphone: adminphone,
                        players: l.getPlayers());
                    addTeam(savedTeam.teamToMap());
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
          child: Icon(Icons.save_outlined)),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: notification,
              icon: Icon(Icons.notifications))
        ],
        centerTitle: true,
        title: Text(
          "Create A New Team",
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "    Team Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            child: Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                children: [
                  TextFormField(
                      onChanged: (val) => tname = val,
                      onSaved: (val) => tname = val!,
                      decoration: InputDecoration(
                        labelText: 'Team Name',
                        icon: Icon(Icons.person),
                      )),
                  TextFormField(
                      onChanged: (val) => adminname = val,
                      onSaved: (val) => adminname = val!,
                      decoration: InputDecoration(
                        labelText: 'Admin Name',
                        icon: Icon(Icons.person),
                      )),
                  TextFormField(
                      onChanged: (val) => email = val,
                      onSaved: (val) => email = val!,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      )),
                  TextFormField(
                      onChanged: (val) => location = val,
                      onSaved: (val) => location = val!,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        icon: Icon(Icons.location_city),
                      )),
                  TextFormField(
                      onChanged: (val) => adminphone = val,
                      onSaved: (val) => adminphone = val!,
                      decoration: InputDecoration(
                        labelText: 'Admin Phone Number',
                        icon: Icon(Icons.phone),
                      )),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              "    Player Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            child: Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                children: [
                  TextFormField(
                      onChanged: (val) => name = val,
                      onSaved: (val) => name = val!,
                      decoration: InputDecoration(
                        labelText: 'Player Name',
                        icon: Icon(Icons.person),
                      )),
                  CheckboxListTile(
                      value: isAdmin,
                      onChanged: (val) {
                        setState(() {
                          isAdmin = !isAdmin;
                        });
                      },
                      title: Text('Admin')),
                  CheckboxListTile(
                      value: isCap,
                      onChanged: (val) {
                        setState(() {
                          isCap = !isCap;
                          print(isCap);
                        });
                      },
                      title: Text('Captain')),
                  DropdownButtonFormField(
                    onSaved: (val) {
                      playertype = val.toString();
                    },
                    //value: playertype,
                    items: ['Bat', 'Bowl', 'WK', 'All']
                        .map<DropdownMenuItem<String>>(
                      (String val) {
                        return DropdownMenuItem(
                          child: Text(val.toString()),
                          value: val.toString(),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(() {
                        playertype = val.toString();
                        print(val.toString());
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Position',
                      icon: Icon(Icons.place),
                    ),
                  ),
                  TextFormField(
                      onChanged: (val) => phone = val,
                      onSaved: (val) => phone = val!,
                      decoration: InputDecoration(
                        labelText: 'Phone number',
                        icon: Icon(Icons.phone),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              l = context.read<PLayerList>();
                              l.addPlayer(createplayer(
                                  name, isAdmin, isCap, playertype, phone));
                              players = l.getPlayers();
                              setState(() {});
                            },
                            child: Text("Add New Player")),
                        ElevatedButton(
                            onPressed: () {
                              l = context.read<PLayerList>();
                              l.clearPlayers();
                            },
                            child: Text("Remove all Player")),
                      ]),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              "    Player Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          (l.addedPlayers.length != 0)
              ? Container(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Consumer<PLayerList>(
                      builder: (context, cart, child) {
                        //return Text("${players}");
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10),
                            itemCount: cart.addedPlayers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                contentPadding: EdgeInsets.all(13),
                                leading: Icon(
                                  Icons.person_outline,
                                  color: Colors.red.shade300,
                                  size: 50,
                                ),
                                title: Text(
                                  "${cart.addedPlayers[index].name}" +
                                      ((cart.addedPlayers[index].isAdmin ==
                                              true)
                                          ? " (Admin)"
                                          : "") +
                                      ((cart.addedPlayers[index].isCap == true)
                                          ? " (C)"
                                          : ""),
                                ),
                                subtitle: Text(
                                    "\nPlayer Type:${cart.addedPlayers[index].playertype}  \nContacts: ${cart.addedPlayers[index].phone}"),
                                trailing: IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {
                                    setState(() {
                                      l.removePlayer(cart.addedPlayers[index]);
                                    });
                                  },
                                ),
                              );
                            });
                      },
                    ),
                  ),
                )
              : SizedBox(
                  height: 10,
                )
        ],
      ),
    );
  }
}
