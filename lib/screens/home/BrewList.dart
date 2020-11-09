import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew_project/models/Brew.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
     if(brews != null && brews is List<Brew>){
      brews.forEach((brew) {
        print(brew.name);
        print(brew.strength);
        print(brew.sugars);
      });
     }

    return Container(
      
    );
  }
}