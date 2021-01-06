import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;

import '../models/user.dart';

abstract class AuthRepository {
  User currentUser();
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
}

class FirebaseAuthRepository implements AuthRepository {
  final firebaseAuth.FirebaseAuth _auth = firebaseAuth.FirebaseAuth.instance;

  //getting the current authenticated user in the firebase auth
  User currentUser() {
    firebaseAuth.User user = _auth.currentUser;
    return user != null ? User(uid: user.uid) : null;
  }

  //firebase login with email and password
  Future<void> login(String email, String password) async {
    try {
      firebaseAuth.UserCredential result = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      return User(uid: result.user.uid);
    } catch (e) {
      throw (e);
    }
  }

  //firebase login with email and password
  Future<void> register(String email, String password) async {
    try {
      firebaseAuth.UserCredential result = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return User(uid: result.user.uid);
    } catch (e) {
      throw (e);
    }
  }

  //logout
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }
}
