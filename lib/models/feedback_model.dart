/// A class representing the feedback model
/// and how it is represented in the database.
///
/// It has methods that converts the data to a map
/// and destruct it back from the map.
class FeedbackModel {
  int feedbackId;
  String status;
  int senderId;
  String subject;
  String message;
  DateTime dateAdded;

  FeedbackModel(
      {this.feedbackId,
      this.status,
      this.senderId,
      this.subject,
      this.message,
      this.dateAdded});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'feedback_id': feedbackId,
      'status': status,
      'sender_id': senderId,
      'subject': subject,
      'message': message,
      'date_added': dateAdded
    };
    return map;
  }

  FeedbackModel.fromMap(Map<String, dynamic> map) {
    feedbackId = map['feedback_id'];
    status = map['status'];
    senderId = map['sender_id'];
    subject = map['subject'];
    message = map['message'];
    dateAdded = map['date_added'];
  }
}
