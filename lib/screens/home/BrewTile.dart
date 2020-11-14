import 'package:flutter/material.dart';
import 'package:brew_crew_project/models/Brew.dart';



class BrewTile extends StatelessWidget {

  final Brew brew;

  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          dense: false,
          onTap: (){},
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/coffee_icon.png"),
            backgroundColor: Colors.brown[brew.strength]
          ),
          title: Text(brew.name),
          subtitle: Text("Takes ${brew.sugars} sugar(s)")
        ),
      )
      );
  }
}