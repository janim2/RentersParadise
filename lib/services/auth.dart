import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future<dynamic> registration(String email, String password) async {
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return newUser.user.uid;
  }

  Future<dynamic> signIn(String email, String password) async {
    final registeredUser = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    // print(registeredUser.user.email);

    return registeredUser.user.uid;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }
}
