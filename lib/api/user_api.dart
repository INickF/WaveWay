import 'package:http/http.dart' as http;
import '../models/user_data.dart';
import 'dart:convert';

class UserApi {
  static String serverUrl = "http://10.0.2.2:8000/api/users";

  static Future<UserData?> registration(String email, String name, String password) async {
    Uri apiUrl = Uri.parse("$serverUrl/register");

    final response = await http.post(
      apiUrl,
      body: json.encode({"email": email, "name": name, "password": password}),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return UserData.fromRawJson(response.body);
    }
    return null;
  }

  static Future<UserData?> login(String email, String password) async {
    Uri apiUrl = Uri.parse("$serverUrl/login");

    final response = await http.post(
      apiUrl,
      body: json.encode({"email": email, "password": password}),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return UserData.fromRawJson(response.body);
    }
    return null;
  }
}
