import 'dart:convert';

class User {
  final String email;
  final String name;
  final String id;
  final List<String> roles;

  User({
    required this.email,
    required this.name,
    required this.id,
    required this.roles,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        name: json["name"],
        id: json["id"],
        roles: List<String>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "id": id,
        "roles": List<dynamic>.from(roles.map((x) => x)),
      };
}
