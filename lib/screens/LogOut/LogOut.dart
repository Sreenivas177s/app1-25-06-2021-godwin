import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LogOut"),
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AlertDialog(
                  title: Text("Are you sure you want to logout?"),
                  actions: <Widget>[
                    ElevatedButton(onPressed: () {}, child: Text("Yes")),
                    ElevatedButton(onPressed: () {}, child: Text("No"))
                  ],
                ),
              ]),
        ),
      )),
    );
  }
}
