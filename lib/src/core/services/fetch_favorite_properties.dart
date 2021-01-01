import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentersparadise/src/core/models/property_model.dart';

/// This class fetches the favorite properties starred by a user
/// authentication must be done for a user to be able to see the
/// listed favorite properties.

class FetchFavoriteProperties {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // static method to retrieve favorite properties
  static Stream<List<Properties>> getFavoriteProperties() async* {
    /// will implement for specific user
    /// when persisting new users to db is done

    final User _user = _auth.currentUser;
    final userId = _user.uid;

    var _values = List<Properties>();

    await _db
        .collection("favourites")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((_doc) async {
                var results = _doc.data();

                if (userId == results["user_id"]){
                                  /// search the properties collection and retrieve the collection
                /// with the id specified in the favourites collection
                await _db
                    .collection("properties")
                    .get()
                    .then((QuerySnapshot querySnapshot) => {
                          querySnapshot.docs.forEach((doc) {
                            if (results["post_id"] == doc.id) {
                              var _results = doc.data();
                              Properties properties =
                                  Properties.fromMap(_results);
                              _values.add(properties);
                            }
                          })
                        });
                }
              })
            });
    yield _values;
  }
}
