import 'package:flutter_auth/models/User.dart';
import 'api.dart';
import 'dart:convert';

class UserService{
  static String baseUrl = "tbluser";

  static Future<List<User>> getUser() async {
    final response = await Network().getData(baseUrl);
    List<User> list = parseResponse(response.body);
    return list;
  }

  static List<User> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}