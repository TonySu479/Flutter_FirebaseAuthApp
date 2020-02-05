import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libero/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      birthdate: snapshot.data['birthdate'],
      gender: snapshot.data['gender'],
    );
  }

  // collection reference
  final CollectionReference userProfileCollection =
      Firestore.instance.collection('userProfile');

  Future updateUserData(String name, String birthdate, String gender) async {
    return await userProfileCollection.document(uid).setData({
      'name': name,
      'birthdate': birthdate,
      'gender': gender,
    });
  }

  // get profiles stream
  Stream<UserData> get profiles {
    return userProfileCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
