/// A class representing the Notification model 
/// and how it is represented in the database.
/// 
/// It has methods that converts the data to a map 
/// and destruct it back from the map.
class Notification {
  int notificationId;
  String status;
  int recepientId;
  String image;
  String message;
  String dateAdded;

    Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'notification_id': notificationId,
      'status': status,
      'recepient_id': recepientId,
      'image': image,
      'message': message,
      'date_added': dateAdded
    };
    return map;
  }

  Notification.fromMap(Map<String, dynamic> map) {
    notificationId = map['notification_id'];
    status = map['status'];
    recepientId = map['recepient_id'];
    image = map['image'];
    message = map['message'];
    dateAdded = map['date_added'];
  }
}
