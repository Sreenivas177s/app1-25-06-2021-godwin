import 'package:flutter/foundation.dart';

class Player {
  String name;
  bool isAdmin, isCap;
  String playertype;
  String phone;
  Player(
      {required this.name,
      required this.playertype,
      required this.phone,
      required this.isAdmin,
      required this.isCap});
}

class Team {
  String tname, adminname, email, location, adminphone, useremail;
  List<Player> players;
  Team(
      {required this.useremail,
      required this.tname,
      required this.adminname,
      required this.email,
      required this.location,
      required this.adminphone,
      required this.players});

  String printTeam() {
    return "${this.useremail} ${this.adminname} ${this.tname} ${this.email} ${this.location} ${this.adminphone} ${this.players}";
  }

  Map<String, dynamic> teamToMap() {
    List playermap = [];
    for (var i = 0; i < this.players.length; i++) {
      var b = this.players[i];
      var a = {
        'name': b.name,
        'playertype': b.playertype,
        'phone': b.phone,
        'isAdmin': b.isAdmin,
        'isCap': b.isCap
      };
      playermap.add(a);
    }
    return {
      'useremail': this.useremail,
      'tname': this.tname,
      'adminname': this.adminname,
      'email': this.email,
      'location': this.location,
      'adminphone': this.adminphone,
      'players': playermap
    };
  }
}

class PLayerList with ChangeNotifier {
  List<Player> addedPlayers = [];

  void addPlayer(Player player) {
    addedPlayers.add(player);
    notifyListeners();
  }

  void removePlayer(Player player) {
    addedPlayers.remove(player);
    notifyListeners();
  }

  List<Player> getPlayers() {
    return addedPlayers;
  }

  void clearPlayers() {
    addedPlayers.clear();
    notifyListeners();
  }
}

Team jsonToTeam(Map json) {
  List playermap = json['players'];
  List<Player> finalp = [];
  for (var i = 0; i < playermap.length; i++) {
    var b = playermap[i];
    finalp.add(Player(
        name: '${b['name']}',
        playertype: '${b['playertype']}',
        phone: '${b['phone']}',
        isAdmin: b['isAdmin'] as bool,
        isCap: b['isCap'] as bool));
  }
  return Team(
      useremail: '${json['useremail']}',
      tname: '${json['tname']}',
      adminname: '${json['adminname']}',
      email: '${json['email']}',
      location: '${json['location']}',
      adminphone: '${json['adminphone']}',
      players: finalp);
}
