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
import 'package:app1/services/pushNotificationsService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(ChangeNotifierProvider(
    create: (context) => PLayerList(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: 'launch_background',
              ),
            ));
      }
    });
  }

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
          '/testpage': (context) => MyAppp(),
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
