import 'package:app1/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
String useremail = "";
bool isNotCreated = true;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();
  String error = "";

  List<String> keys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NORMAL DAY HEROES"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Login With Your Account"),
          TextField(controller: emailctrl),
          TextField(
            controller: passwordctrl,
            obscuringCharacter: '*',
            obscureText: true,
          ),
          Text(error, style: TextStyle(color: Colors.red)),
          ElevatedButton(
              onPressed: () async {
                auth
                    .signInWithEmailAndPassword(
                        email: emailctrl.text.trim(),
                        password: passwordctrl.text.trim())
                    .then((_) {
                  useremail = emailctrl.text.trim();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyHomePage(title: "")));
                });
                print(emailctrl.text);
              },
              child: Text("Login")),
          (isNotCreated)?ElevatedButton(
              onPressed: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: emailctrl.text.trim(),
                        password: passwordctrl.text.trim())
                    .then((_) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyHomePage(title: "")));
                });
              },
              child: Text("Create New User")):Text(""),
        ],
      )),
    );
  }
}
