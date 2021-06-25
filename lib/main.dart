import 'package:app1/screens/CreateJoinRoom/CreateJoinRoom.dart';
import 'package:app1/screens/CreateJoinRoom/TeamDetails.dart';
import 'package:app1/screens/DressingRoom/DressingRoom.dart';
import 'package:app1/screens/Exit/Exit.dart';
import 'package:app1/screens/LIveTournamentScores/LiveTournaments.dart';
import 'package:app1/screens/LogOut/LogOut.dart';
import 'package:app1/screens/Settings/Settings.dart';
import 'package:app1/screens/ViewTeams/ViewTeams.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.grey.shade700,
          // primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: ''),
        debugShowCheckedModeBanner: true,
        initialRoute: '/',
        routes: {
          //'/': (context) => MyApp(),
          '/dressingroom': (context) => DressingRoom(),
          '/livescores': (context) => LiveTournaments(),
          '/createteam': (context) => CreateJoinRoom(),
          '/viewteam': (context) => ViewTeams(),
          '/settings': (context) => Settings(),
          '/logout': (context) => LogOut(),
          '/exit': (context) => Exit(),
          '/teamdetails': (context) => TeamDetails(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 190,
              color: Colors.grey.shade700,
              // color: Color(0xFF545454), //IRON GREY
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Match Day",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
            menus(
              icon1: (Icons.home),
              icon2: (Icons.chevron_right),
              text: "Dressing Room",
              page: '/dressingroom',
            ),
            menus(
              icon1: (Icons.sports_cricket),
              icon2: (Icons.chevron_right),
              text: "Live Tournament Scores",
              page: '/livescores',
            ),
            menus(
              icon1: (Icons.group_add),
              icon2: (Icons.chevron_right),
              text: "Create/Join Team",
              page: '/createteam',
            ),
            menus(
              icon1: (Icons.table_chart),
              icon2: (Icons.chevron_right),
              text: "View Teams",
              page: '/viewteam',
            ),
            menus(
              icon1: (Icons.settings),
              icon2: (Icons.chevron_right),
              text: "Settings",
              page: '/settings',
            ),
            menus(
              icon1: (Icons.logout),
              icon2: (Icons.chevron_right),
              text: "Logout",
              page: '/logout',
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit"),
              onTap: () {
                Navigator.pop(context, '');
                Navigator.pushNamed(context, '/exit');
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile menus({
    required IconData icon1,
    required IconData icon2,
    required String text,
    required String page,
  }) {
    return ListTile(
        leading: Icon(icon1),
        title: Text(text),
        trailing: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: new IconButton(
                icon: new Icon(icon2),
                onPressed: () {
                  // Navigator.pop(context, '');
                  Navigator.pushNamed(context, page);
                },
              ),
            )
          ],
          //Icon(icon2),
        ));
  }
}
