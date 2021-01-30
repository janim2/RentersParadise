import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// this class handles posting a new database to the
/// database.

class PostProperty {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final User user = _auth.currentUser;
  static final userId = user.uid;

  static dynamic postProperty(Map<String, dynamic> map) async {
    DocumentReference reference = await _db.collection("properties").add(map);
    return reference.id;
  }
}
