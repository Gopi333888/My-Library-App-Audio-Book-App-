import 'package:cloud_firestore/cloud_firestore.dart';

class Databaseservice {
  final String? uid;
  Databaseservice({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future updateUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "uid": uid,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
