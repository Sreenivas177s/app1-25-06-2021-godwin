import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TeamDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        shadowColor: Colors.grey.shade700,
        foregroundColor: Colors.grey.shade700,
        backgroundColor: Colors.grey.shade700,
        centerTitle: true,
        title: Text("Team Details"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Container(
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
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                          color: Colors.white,
                          height: 170,
                          width: 170,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "\ntest -260421-3 ",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text("test ",
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.amber.shade700,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  "Total Players: 1 \n"
                                  "Short Name: test\n"
                                  "Admin Name: abcd ",
                                  style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 170,
                          width: 170,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 19),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                  "Team Email:test@ymail.com\n"
                                  "Team Location: test\n"
                                  "Admin Contacts: +91996285536",
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      ],
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
                height: 390,
                width: double.infinity,
                child: Column(children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.all(13),
                    leading: Icon(
                      Icons.person_outline,
                      color: Colors.red.shade300,
                      size: 50,
                    ),
                    title: Text(
                      "abcd (Admin) (C)",
                    ),
                    subtitle: Text(
                        "\nPlayer Type: Allrounder \nContacts: +919962855365"),
                    trailing: new Column(children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: new IconButton(
                              icon: new Icon(Icons.more_vert),
                              iconSize: 25,
                              onPressed: () {
                                //  Navigator.pushNamed(context, '/teamdetails');
                              }))
                    ]),
                  )
                ]),
              ),
            )
          ],
        )),
      ),
    );
  }
}
