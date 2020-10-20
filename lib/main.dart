import 'package:brew_crew_project/models/UserModel.dart';
import 'package:brew_crew_project/screens/wrapper.dart';
import 'package:brew_crew_project/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
          child: MaterialApp(
            home: Wrapper(),
          ),
        );
  }
}

