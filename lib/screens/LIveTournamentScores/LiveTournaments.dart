import 'package:flutter/material.dart';

class LiveTournaments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Tournaments"),
      ),
      body: Card(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 200,
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
