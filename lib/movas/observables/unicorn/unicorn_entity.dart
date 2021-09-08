class UnicornE {
  final String? id;
  final String? name;
  final String? color;
  final int? age;

  UnicornE({this.id, this.name, this.color, this.age,});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "colour": color,
      "age": age,
    };
  }

  factory UnicornE.fromMap(Map<String, dynamic> map) {
    return UnicornE(
      id: map['_id'],
      name: map['name'],
      color: map['colour'],
      age: map['age'],
    );
  }
}
