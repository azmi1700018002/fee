import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'https://fleetime.herokuapp.com/api/';
  // final String _url = 'http://192.168.100.207:8080/api/';
  // 192.168.1.2 is my IP, change with your IP address
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'));
  }

  auth(data, apiURL) async {
    var fullUrl = _url + apiURL;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiURL) async {
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  updateData(apiURL, id, body ) async {
    var fullUrl = _url + apiURL + '/' + id.toString();
    await _getToken();
    return await http.put(
      fullUrl,
      headers: _setHeaders(),
      body: json.encode(body),
    );
  }

  deleteData(apiURL, id) async {
    var fullUrl = _url + apiURL + '/' + id.toString();
    await _getToken();
    return await http.delete(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
