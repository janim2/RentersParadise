class Properties {
  int propertyId;
  String status;
  dynamic pictures;
  dynamic reason;
  String propertyType;
  String details;
  String location;
  String streetName;
  int bedroom;
  int bathroom;
  int parking;
  double price;
  int uploaderId;
  String duration;
  String features;
  int views;
  DateTime dateAdded;

  Properties(
      this.propertyId,
      this.status,
      this.pictures,
      this.reason,
      this.propertyType,
      this.details,
      this.location,
      this.streetName,
      this.bedroom,
      this.bathroom,
      this.parking,
      this.price,
      this.uploaderId,
      this.duration,
      this.features,
      this.views,
      this.dateAdded);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'propertyId': propertyId,
      'status': status,
      'pictures': pictures,
      'reason': reason,
      'propertyType': propertyType,
      'details': details,
      'location': location,
      'streetName': streetName,
      'bedroom': bedroom,
      'bathroom': bathroom,
      'parking': parking,
      'price': price,
      'uploaderId': uploaderId,
      'duration': duration,
      'features': features,
      'views': views,
      'dateAdded': dateAdded,
    };

    return map;
  }

  Properties.fromMap(Map<String, dynamic> map) {
    propertyId = map['propertyId'];
    status = map['status'];
    pictures = map['pictures'];
    reason = map['reason'];
    propertyType = map['propertyType'];
    details = map['details'];
    location = map['location'];
    streetName = map['streetName'];
    bedroom = map['bedroom'];
    bathroom = map['bathroom'];
    parking = map['parking'];
    price = map['price'];
    uploaderId = map['uploaderId'];
    duration = map['duration'];
    features = map['features'];
    views = map['views'];
    dateAdded = map['dateAdded'];
  }
}
