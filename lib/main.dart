import 'package:app1/screens/CreateJoinRoom/CreateJoinRoom.dart';
import 'package:app1/screens/CreateJoinRoom/TeamDetails.dart';
import 'package:app1/screens/CreateJoinRoom/createNewTeam.dart';
import 'package:app1/screens/CreateJoinRoom/team_player.dart';
import 'package:app1/screens/DressingRoom/DressingRoom.dart';
import 'package:app1/screens/Exit/Exit.dart';
import 'package:app1/screens/LIveTournamentScores/LiveTournaments.dart';
import 'package:app1/screens/Loginpage/login.dart';
import 'package:app1/screens/Settings/Settings.dart';
import 'package:app1/screens/ViewTeams/ViewTeams.dart';
import 'package:app1/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => PLayerList(),
    child: MyApp(),
  ));
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
        debugShowCheckedModeBanner: true,
        initialRoute: '/loginpage',
        routes: {
          //'/': (context) => MyApp(),
          '/createnewteam': (context) => CreateTeam(),
          '/homepage': (context) => MyHomePage(title: ""),
          '/loginpage': (context) => LoginPage(),
          '/dressingroom': (context) => DressingRoom(),
          '/livescores': (context) => LiveTournaments(),
          '/createteam': (context) => CreateJoinRoom(),
          '/viewteam': (context) => ViewTeams(),
          '/settings': (context) => Settings(),
          '/exit': (context) => Exit(),
          '/teamdetails': (context) => TeamDetails(),
        });
  }
}

