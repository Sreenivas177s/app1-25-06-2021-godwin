import 'package:flutter/material.dart';

class Exit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("EXIT"),
      ),
      body: Container(
          child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Container(
          alignment: Alignment.topLeft,
          height: 700,
          width: 340,
          child: Column(children: <Widget>[]),
        ),
      )),
    );
  }
}
