import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

abstract class AuthRepository {
  User currentUser();
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
  Future<void> passwordResetSubmit(String email);
  Future<void> signInWithGoogle();
  Future<bool> isFirstRun();
  Future<void> updatePersonalData(
      String firstname, String lastName, String birthday);
}

class FirebaseAuthRepository implements AuthRepository {
  final firebaseAuth.FirebaseAuth _auth = firebaseAuth.FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

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
      final prefs = await SharedPreferences.getInstance();
      var key = 'uid';
      var val = result.user.uid;
      prefs.setString(key, val);
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
      final prefs = await SharedPreferences.getInstance();
      var key = 'uid';
      var val = result.user.uid;
      prefs.setString(key, val);
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

  @override
  Future<void> passwordResetSubmit(String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw e;
    }
  }

  //Google Authentication
  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final firebaseAuth.GoogleAuthCredential credential =
          firebaseAuth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      firebaseAuth.UserCredential result =
          await _auth.signInWithCredential(credential);
      final prefs = await SharedPreferences.getInstance();
      var key = 'uid';
      var val = result.user.uid;
      prefs.setString(key, val);
      return User(uid: result.user.uid);
    } catch (e) {
      throw (e);
    }
  }

  Future<bool> isFirstRun() async {
    DocumentSnapshot userdoc = await users.doc(currentUser().uid).get();
    if (userdoc.exists) {
      return false;
    }
    return true;
  }

  @override
  Future<void> updatePersonalData(
      String firstname, String lastName, String birthday) async {
    try {
      await users.doc(currentUser().uid).set(
          {'firstName': firstname, 'lastName': lastName, 'birthday': birthday});
    } catch (e) {
      throw (e);
    }
  }
}
