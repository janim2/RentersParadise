/// FavouritesModel represents the News table
/// with the fields [id], [status], [userId], [postId] and [dateAdded]
class FavouritesModel {
  String id;
  String status;
  int userId;
  String postId;
  DateTime dateAdded;

  FavouritesModel(this.id, this.status, this.userId, this.postId, this.dateAdded);

  // converts FavouritesModel  details to a Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'status': status,
      'userId': userId,
      'postId': postId,
      'dateAdded': dateAdded
    };

    return map;
  }

  // destruct map of FavouritesModel
  FavouritesModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    status = map['status'];
    userId = map['userId'];
    postId = map['postId'];
    dateAdded = map['dateAdded'];
  }
}
