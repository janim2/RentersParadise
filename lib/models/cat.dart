// this is a mock up model to get you started...

class Cat {
  String id;
  int name;

  Cat(this.id, this.name);

  // converts cat  details to a Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name
    };

    return map;
  }

  // destruct map of cat
  Cat.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}