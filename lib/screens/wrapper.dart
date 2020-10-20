import 'package:brew_crew_project/screens/authenticate/authenticate.dart';
import 'package:brew_crew_project/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew_project/models/UserModel.dart';



 class Wrapper extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     final user = Provider.of<UserModel>(context);
     //return either a home or authenticate widget
     if(user == null){
       return Authenticate();
     }else{
       return Home();
     }
     
   }
 }