import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          settingname(icon: Icons.account_circle, text: 'My Account'),
          settingname(icon: Icons.settings, text: 'Account Settings'),
          settingname(icon: Icons.account_balance_wallet, text: 'Your Balance'),
          settingname(icon: Icons.language, text: 'Language'),
          settingname(icon: Icons.feedback, text: 'Feedback'),
          settingname(icon: Icons.logout, text: 'Logout'),
          settingname(icon: Icons.exit_to_app, text: 'Exit'),
        ],
      )),
    );
  }

  Card settingname({required IconData icon, required String text}) {
    return Card(
      margin: EdgeInsets.all(3),
      color: Colors.grey.shade300,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        alignment: Alignment.topLeft,
        height: 80,
        width: double.infinity,
        child: Column(children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(
              icon,
              size: 40,
            ),
            title: Text(text),
            onTap: () {},
          )
        ]),
      ),
    );
  }
}
