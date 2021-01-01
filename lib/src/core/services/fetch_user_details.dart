import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// this class is the entry point for fetching user details from the database
/// this class does not need to be initialised.

class UserDetails {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static Map<String, dynamic> _userDetails = {};

  /// static method that access database user data and returns a map
  static Future<Map<String, dynamic>> loadUserDetails() async {
    final User _user = _auth.currentUser;

    /// get the uid of the current logged in user.
    final _userId = _user.uid;

    /// perform a read operation to on the user collection to retrieve the user details
    await _firebaseFirestore
        .collection("users")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                /// if the userId of the document matches the _userId
                /// return the details for the user.
                var queryResult = doc.data();
                if (_userId == queryResult["userId"]) {
                  _userDetails = queryResult;
                }
              })
            });
    return _userDetails;
  }
}
