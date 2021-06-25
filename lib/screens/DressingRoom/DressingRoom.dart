import 'package:app1/screens/DressingRoom/AllMatches.dart';
import 'package:app1/screens/DressingRoom/YourMatches.dart';
import 'package:flutter/material.dart';

class DressingRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dressing Room"),
          bottom: TabBar(
            indicatorColor: Colors.amber.shade700,
            tabs: <Widget>[
              Tab(
                text: "Your Matches",
              ),
              Tab(
                text: "All Matches",
              ),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(children: <Widget>[
          YourMatches(),
          AllMatches(),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Create Match'),
          icon: const Icon(Icons.sports_cricket),
          backgroundColor: Colors.amber.shade700,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
