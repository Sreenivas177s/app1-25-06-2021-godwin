import 'package:app1/screens/Loginpage/login.dart';
import 'package:flutter/material.dart';

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
  List final_set = ["","",""];
  String mi =
          "Mumbai Indians \n  Rohit Sharma (c) (bat) \n  Sachin Tendulkar(bat) \n  Jasprit Bumrah(c)",
      csk =
          "Chennai Super Kings \n  MS Dhone(c) (WK) \n  Stephen Fleming (bat) \n  Ravindra Jadeja (ALL)",
      srh =
          "SunRisers Hyderabad \n  Kane Williamson (c) (bat) \n  Raashid Khan (bowl) \n David Warner (bat)";
  List getTeamset() {
    var sets = [
      [
        mi,
        csk,
        srh,
      ],
      [csk, mi, srh],
      [srh, csk, mi]
    ];
    return sets[(useremail.length % 3)];
  }

  AnimationFunction() {
    setState(() {
      _width = _width == 400 ? 400 : 400;
      _height = _height == 570 ? 130: 570;
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

  @override
  void initState() {
    super.initState();
    final_set = getTeamset();
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
            children: <Widget>[
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
                  child: Text("Click  here for Team 3"))
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
