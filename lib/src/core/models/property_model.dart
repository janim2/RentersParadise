class Properties {
  int propertyId;
  String status;
  dynamic picture;
  dynamic reason;
  String propertyType;
  String details;
  String location;
  String streetName;
  String bedroom;
  String bathroom;
  String parking;
  String price;
  String uploaderId;
  String duration;
  String features;
  int views;
  String dateAdded;
  String name;

  Properties(
      {this.propertyId,
      this.status,
      this.picture,
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
      this.dateAdded,
      this.name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'propertyId': propertyId,
      'status': status,
      'picture': picture,
      'reason': reason,
      'property_type': propertyType,
      'details': details,
      'location': location,
      'streetname': streetName,
      'bedroom': bedroom,
      'bathroom': bathroom,
      'parking': parking,
      'price': price,
      'uploaderId': uploaderId,
      'duration': duration,
      'features': features,
      'views': views,
      'dateAdded': dateAdded,
      'name': name
    };

    return map;
  }

  Properties.fromMap(Map<String, dynamic> map) {
    propertyId = map['property_id'];
    status = map['status'];
    picture = map['picture'];
    reason = map['reason'];
    propertyType = map['property_type'];
    details = map['details'];
    location = map['location'];
    streetName = map['streetname'];
    bedroom = map['bedroom'];
    bathroom = map['bathroom'];
    parking = map['parking'];
    price = map['prize'];
    uploaderId = map['uploader_id'];
    duration = map['duration'];
    features = map['features'];
    views = map['views'];
    dateAdded = map['date_added'];
    name = map['name'];
  }
}
