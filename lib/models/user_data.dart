import 'dart:convert';
import 'user.dart';

class UserData {
  final String refreshToken;
  final String accessToken;
  final User user;

  UserData({
    required this.refreshToken,
    required this.accessToken,
    required this.user,
  });

  factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        refreshToken: json["refreshToken"],
        accessToken: json["accessToken"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
        "accessToken": accessToken,
        "user": user.toJson(),
      };
}
