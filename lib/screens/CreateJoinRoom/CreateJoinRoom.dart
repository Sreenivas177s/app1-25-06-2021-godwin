import 'package:app1/screens/CreateJoinRoom/AllTeams.dart';
import 'package:app1/screens/CreateJoinRoom/YourTeams.dart';
import 'package:flutter/material.dart';

class CreateJoinRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade700,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Create/Join Team",
          ),
          bottom: TabBar(
            indicatorColor: Colors.amber.shade700,
            tabs: <Widget>[
              Tab(
                text: "Your Teams",
              ),
              Tab(
                text: "All Teams",
              ),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(children: <Widget>[
          YourTeams(),
          AllTeams(),
        ]),
      ),
    );
  }
}
