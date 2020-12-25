import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged.map((user) {
      if (user!=null) {
        // User is signed in.
        return user;
      } else {
        // No user is signed in.
        return null;
      }
    });
    // .map(_userFromFirebaseUser);
  }
}
