import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew_project/models/Brew.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew_project/models/UserModel.dart';


class DatabaseService{
  final String uid;

  DatabaseService({this.uid});
  // Collection Reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection("brews");
  
  Future updateUserData (String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      "sugars": sugars,
      "name": name,
      "strength": strength
    });
  }

  //brew list from the snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return  snapshot.docs.map((doc){
      return Brew(
        name: doc.data()['name'] ?? '',
        sugars: doc.data()['sugars'] ?? '0',
        strength: doc.data()['strength'] ?? 0
      );
    }).toList();
  }


  //get brews Stream
  Stream <List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

//user Data from snapShot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      sugars: snapshot.data()['sugars'],
      strength: snapshot.data()['strength']
    );
  }

  //get user doc stream
  Stream<UserData> get userData{
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

}