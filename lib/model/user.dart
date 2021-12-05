class User {
  String? id;
  String? index;
  String? email;
  String? name;
  String? password;
  String? datereg;

  User({
    required this.id,
    required this.index,
    required this.email,
    required this.name,
    required this.password,
    required this.datereg,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    datereg = json['regdate'];
  }
}
