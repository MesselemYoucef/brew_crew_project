import 'package:brew_crew_project/screens/authenticate/sign_in.dart';
import 'package:brew_crew_project/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew_project/screens/authenticate/Register.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }
  }
}