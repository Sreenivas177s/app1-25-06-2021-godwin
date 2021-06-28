import 'package:app1/screens/CreateJoinRoom/AllTeams.dart';
import 'package:app1/screens/CreateJoinRoom/YourTeams.dart';
import 'package:app1/services/rtDatabase.dart';
import 'package:flutter/material.dart';

class CreateJoinRoom extends StatefulWidget {
  @override
  _CreateJoinRoomState createState() => _CreateJoinRoomState();
}

class _CreateJoinRoomState extends State<CreateJoinRoom> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade700,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createnewteam');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey.shade700,
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Create/Join Team",
          ),
          bottom: TabBar(
            indicatorColor: Colors.amber.shade700,
            tabs: <Widget>[
              Tab(
                text: "All Teams",
              ),
              Tab(
                text: "Your Teams",
              ),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(children: <Widget>[
          
          AllTeams(),
          YourTeams(),
        ]),
      ),
    );
  }
}
