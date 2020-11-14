import 'package:brew_crew_project/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew_project/shared/constants.dart';
import 'package:brew_crew_project/models/UserModel.dart';
import 'package:brew_crew_project/services/DatabaseService.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData _currentUser = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children:<Widget>[
                Text(
                  'Update your brew settings. ',
                  style: TextStyle(fontSize: 18.0)
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _currentUser.name,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val)=> setState(()=> _currentName = val),
                  
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: _currentSugars ?? _currentUser.sugars,
                  items: sugars.map((sugar){
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text(" $sugar sugars")
                      );
                  }).toList(),
                  onChanged: (value){
                    setState(() => _currentSugars = value);
                  },
                ),
                SizedBox(height: 20.0),
                //slider
                Slider(
                  min: 100,
                  max: 900,
                  label: "$_currentStrength",
                  divisions: 8,
                  activeColor: Colors.brown[_currentStrength ?? _currentUser.strength],
                  inactiveColor: Colors.brown[_currentStrength ?? _currentUser.strength],
                  value: (_currentStrength ?? _currentUser.strength).toDouble(),
                  onChanged: (val)=> setState(() => _currentStrength = val.round()),
                  ),
                //button
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: ()async{
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? _currentUser.sugars, 
                        _currentName ?? _currentUser.name, 
                        _currentStrength ?? _currentUser.strength
                        );
                        Navigator.pop(context);
                    }
                  },
                ),
              ]
            ),
          );
        }else{
          return Loading();
        }
      }
    );
  }
}