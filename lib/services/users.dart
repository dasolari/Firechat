import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechat/models/user.dart';


class UserDatabaseService {
  final String? uid;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  UserDatabaseService({ this.uid });

  Stream<DocumentSnapshot> get user {
    return await usersCollection.doc(uid).get();
  }

  // Adapt Firebase response to custom User object
  User? _userFromFirestore(DocumentSnapshot? doc) {
    return user != null ? User(firstName: doc.data()['firstName'], lastName: doc.data['lastName'], email: doc.data['email']) : null;
  }

  Future updateUser(String firstName, String lastName, String email) async {
    return await usersCollection.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    });
  }
}
