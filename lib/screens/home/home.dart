import 'package:brew_crew_project/models/UserModel.dart';
import 'package:brew_crew_project/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew_project/services/DatabaseService.dart';
import 'package:provider/provider.dart';
import 'BrewList.dart';
import 'package:brew_crew_project/models/Brew.dart';

class Home extends StatelessWidget {
    final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async{
                await _auth.signOut();
              }, 
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ), 
              label: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}