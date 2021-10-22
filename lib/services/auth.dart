import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechat/models/auth.dart';
import 'package:firechat/models/response.dart';
import 'package:firechat/services/user.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Adapt Firebase response to custom User object
  Auth? _userFromFirebaseUser(User? user) {
    return user != null ? Auth(uid: user.uid) : null;
  }

  // Set the stream listener for authStateChanges
  Stream<Auth?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Anonymous Sign In (unused)
  Future<Response> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return Response(data: _userFromFirebaseUser(user));
    } on FirebaseAuthException catch(error) {
      return Response(data: null, message: error.message);
    }
  }

  // Sign In with email and password
  Future<Response> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return Response(data: _userFromFirebaseUser(user));
    } on FirebaseAuthException catch(error) {
      return Response(data: null, message: error.message);
    }
  }

  // Register with email and password
  Future<Response> registerWithEmailAndPassword(String email, String password, String firstName, String lastName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      // Create a new user document in the database
      await UserDatabaseService(uid: user.uid).updateUser(firstName, lastName, email);
      return Response(data: _userFromFirebaseUser(user));
    } on FirebaseAuthException catch (error) {
      return Response(data: null, message: error.message);
    }
  }

  // Logout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch(error) {
      print(error.message);
    }
  }
}