import 'package:brew_crew_project/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew_project/services/AuthService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create a User Object based on the Firebase user
  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserModel> get user{
    return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
  }

  //Signin anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email and password

  //register with email and password

  //Sign out

  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
