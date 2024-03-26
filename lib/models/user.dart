class User {
  final int id;
  final String name;


  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
          );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
     };

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
         };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      );
  }
}
