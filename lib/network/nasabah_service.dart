import 'package:flutter_auth/Models/nasabah.dart';
import 'api.dart';
import 'dart:convert';

class NasabahService{
  static String baseUrl = "mstdebitur";

  static Future<List<Nasabah>> getUser() async {
    final response = await Network().getData(baseUrl);
    List<Nasabah> list = parseResponse(response.body);
    return list;
  }

  static Future<List<Nasabah>> updateUser(id) async {
    Map<String, String> data;
    final response = await Network().updateData(baseUrl, id, data,);
    List<Nasabah> list = parseResponse(response.body);
    return list;
  }

  static Future<List<Nasabah>> deleteUser(id) async {
    final response = await Network().deleteData(baseUrl, id);
    // List<Nasabah> list = parseResponse(response.body);
    return [];
  }

  static List<Nasabah> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Nasabah>((json) => Nasabah.fromJson(json)).toList();
  }
}