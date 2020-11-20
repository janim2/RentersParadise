class Users {
  int userId;
  String status;
  String userType;
  dynamic profilePicture;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String residentialAddress;
  String password;
  DateTime dateRegistered;
  int viewsRemaining;

  Users(
    this.userId,
    this.status,
    this.userType,
    this.profilePicture,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.residentialAddress,
    this.password,
    this.dateRegistered,
    this.viewsRemaining,
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userId': userId,
      'status': status,
      'userType': userType,
      'profilePicture': profilePicture,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'residentialAddress': residentialAddress,
      'password': password,
      'dateRegistered': dateRegistered,
      'viewsRemaining': viewsRemaining,
    };

    return map;
  }

  Users.fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    status = map['status'];
    userType = map['userType'];
    profilePicture = map['profilePicture'];
    firstName = map['firstName'];
    lastName = map['streetName'];
    email = map['parking'];
    phoneNumber = map['price'];
    residentialAddress = map['uploaderId'];
    password = map['duration'];
    dateRegistered = map['features'];
    viewsRemaining = map['views'];
  }
}
