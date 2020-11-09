import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew_project/models/Brew.dart';


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
    print('=======================');
    print(brewCollection.snapshots());
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

}