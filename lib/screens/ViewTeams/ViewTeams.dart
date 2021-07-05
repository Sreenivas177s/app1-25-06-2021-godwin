import 'package:app1/screens/Loginpage/login.dart';
import 'package:app1/services/rtDatabase.dart';
import 'package:flutter/material.dart';

var iplTeams;

class ViewTeams extends StatefulWidget {
  const ViewTeams({Key? key}) : super(key: key);

  @override
  _ViewTeamsState createState() => _ViewTeamsState();
}

class _ViewTeamsState extends State<ViewTeams> {
  double _width = 0;
  double _height = 0;
  double _width1 = 0;
  double _height1 = 0;
  double _width2 = 0;
  double _height2 = 0;
  List final_set = ["", "", ""];
  String a = "", b = "", c = '';
  List<String> teamlist = ['mi', 'csk', 'srh', 'dc', 'pk', 'kkr', 'rcb', 'rr'];

  AnimationFunction() {
    setState(() {
      _width = _width == 400 ? 400 : 400;
      _height = _height == 570 ? 130 : 570;
    });
  }

  AnimationFunction1() {
    setState(() {
      _width1 = _width1 == 400 ? 400 : 400;
      _height1 = _height1 == 570 ? 130 : 570;
    });
  }

  AnimationFunction2() {
    setState(() {
      _width2 = _width2 == 400 ? 400 : 400;
      _height2 = _height2 == 570 ? 130 : 570;
    });
  }

  void setTeamList() {
    if (a != "") {
      final_set[0] = iplTeams[a];
      teamlist.remove(a);
    }
    if (b != "") {
      final_set[1] = iplTeams[b];
      teamlist.remove(b);
    }
    if (c != "") {
      final_set[2] = iplTeams[c];
      teamlist.remove(c);
    }
  }

  @override
  void initState() {
    super.initState();
    getIplTeam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        centerTitle: true,
        title: Text("View Teams"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          // duration: Duration(seconds: 2),
          //  curve: Curves.bounceInOut,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(seconds: 2),
                      color: Colors.blue.shade300,
                      alignment: Alignment.topLeft,
                      height: _height, //700,
                      width: _width, //double.infinity,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.blue.shade300,
                            alignment: Alignment.center,
                            child: Text(
                              final_set[0],
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),

                      //  mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    AnimationFunction();
                  },
                  child: Text("Click  here for Team 1")),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(seconds: 2),
                      color: Colors.yellow.shade300,
                      alignment: Alignment.topLeft,
                      height: _height1, //700,
                      width: _width1, //double.infinity,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.yellow.shade300,
                            alignment: Alignment.center,
                            child: Text(
                              final_set[1],
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),

                      //  mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    AnimationFunction1();
                  },
                  child: Text("Click  here for Team 2")),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(seconds: 2),
                      color: Colors.orange.shade300,
                      alignment: Alignment.topLeft,
                      height: _height2, //700,
                      width: _width2, //double.infinity,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            color: Colors.orange.shade300,
                            alignment: Alignment.center,
                            child: Text(
                              final_set[2],
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
                      ),

                      //  mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    AnimationFunction2();
                  },
                  child: Text("Click  here for Team 3")),
              (a == "")
                  ? DropdownButtonFormField(
                      onSaved: (val) {
                        a = val.toString();
                      },
                      //value: playertype,
                      items: teamlist.map<DropdownMenuItem<String>>(
                        (String val) {
                          return DropdownMenuItem(
                            child: Text(val.toString()),
                            value: val.toString(),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          a = val.toString();
                          setTeamList();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Team 1',
                        icon: Icon(Icons.place),
                      ),
                    )
                  : Text(""),
              (b == "")
                  ? DropdownButtonFormField(
                      onSaved: (val) {
                        b = val.toString();
                      },
                      //value: playertype,
                      items: teamlist.map<DropdownMenuItem<String>>(
                        (String val) {
                          return DropdownMenuItem(
                            child: Text(val.toString()),
                            value: val.toString(),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          b = val.toString();
                          setTeamList();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Team 2',
                        icon: Icon(Icons.place),
                      ),
                    )
                  : Text(""),
              (c == "")
                  ? DropdownButtonFormField(
                      onSaved: (val) {
                        c = val.toString();
                      },
                      //value: playertype,
                      items: teamlist.map<DropdownMenuItem<String>>(
                        (String val) {
                          return DropdownMenuItem(
                            child: Text(val.toString()),
                            value: val.toString(),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          c = val.toString();
                          setTeamList();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Team 3',
                        icon: Icon(Icons.place),
                      ),
                    )
                  : Text(""),
            ],
          ),
        ),
      ),
    );
  }
}

//class ViewTeams1 extends StatelessWidget {
//  @override
 // Widget build(BuildContext context) {
  //  return S

//void AnimationFunction() {
//}
