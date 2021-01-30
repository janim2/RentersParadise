import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentersparadise/src/core/models/notification_model.dart';

/// this class fetches the notification for a specific user
/// based on the user's id.
/// only logged in users can have access to their notifications.
class FetchNotification {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static List<NotificationModel> _list = [];

  // creating a method that retrieves the data from the database
  static Future<List<NotificationModel>> getNotifications() async {
    // getting logged in user_id
    final User _user = _auth.currentUser;
    final userId = _user.uid;
    List _values = [];
    // retrieving the notifications from the collections based on the
    // id of the user logged in.
    await _db
        .collection('notifications')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                var results = doc.data();
                if (userId == results["user_id"]) {
                  _values.add(results);
                }
              })
            });
    for (Map<String, dynamic> map in _values) {
      NotificationModel notificationModel = NotificationModel.fromMap(map);
      _list.add(notificationModel);
    }
    return _list;
  }
}
