import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future<dynamic> registration(String email, String password, String firstName,
      String lastName, String phoneNumber, String residentialAddress) async {
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    String uid = _auth.currentUser.uid.toString();

    // String displayName = _auth.currentUser.displayName;

    users.add({
      'userId': uid,
      'email': email,
      'fname': firstName,
      'lname': lastName,
      'phoneNumber': phoneNumber,
      'residentialAddress': residentialAddress,
      //'password': password,
    });

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
