import 'package:app1/screens/CreateJoinRoom/YourTeams.dart';
import 'package:app1/screens/CreateJoinRoom/team_player.dart';
import 'package:app1/screens/ViewTeams/ViewTeams.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void addTeam(Map team) {
  CollectionReference collectionreference =
      FirebaseFirestore.instance.collection('teams'); //reference to my table
  collectionreference.add(team);
}

void getTeam() {
  var data;
  CollectionReference collectionreference =
      FirebaseFirestore.instance.collection('teams');
  collectionreference.snapshots().listen((snapshot) {
    data = snapshot.docs;
    teams.clear();
    for (var i = 0; i < data.length; i++) {
      teams.add(jsonToTeam(data[i].data()));
    }
  });

  // return convertedlist;
  //print(convertedlist[0].tname);
}

void deleteTeam(Team teamz) async {
  CollectionReference collectionreference =
      FirebaseFirestore.instance.collection('teams');
  QuerySnapshot querySnapshot = await collectionreference.get();
  var pos;
  for (var item in teams) {
    if (item.useremail == teamz.useremail &&
        item.players.length == teamz.players.length &&
        item.adminname == teamz.adminname) {
      pos = teams.indexOf(item);
    }
  }
  print(pos);
  querySnapshot.docs[pos].reference.delete();
}

void getIplTeam() {
  CollectionReference collectionreference =
      FirebaseFirestore.instance.collection('retrieveTeam');
  collectionreference.snapshots().listen((snapshot) {
      iplTeams=(snapshot.docs[0].data());
  });
}
