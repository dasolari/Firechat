import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechat/models/user.dart';


class UserDatabaseService {
  final String uid;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  UserDatabaseService({ required this.uid });

  // User Document String
  Stream<User> get user {
    return usersCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  // Adapt Firebase response to custom User object
  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    dynamic data = snapshot.data();
    return User.fromMap(data);
  }

  Future updateUser(String firstName, String lastName, String email) async {
    return await usersCollection.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    });
  }
}
