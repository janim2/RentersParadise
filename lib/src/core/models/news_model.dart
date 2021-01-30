/// NewsModel represents the News table
/// with the fields [id], [status], [title], [messageId] and [dateAdded]
class NewsModel {
  String id;
  String status;
  int title;
  String messageId;
  DateTime dateAdded;

  NewsModel({this.id, this.status, this.title, this.messageId, this.dateAdded});

  // converts NewsModel  details to a Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'status': status,
      'title': title,
      'messageId': messageId,
      'dateAdded': dateAdded
    };

    return map;
  }

  // destruct map of NewsModel
  NewsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    status = map['status'];
    title = map['title'];
    messageId = map['messageId'];
    dateAdded = map['dateAdded'];
  }
}
