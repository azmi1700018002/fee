import 'package:flutter/material.dart';
import 'package:flutter_auth/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/network/api.dart';
import 'dart:convert';

import '../../../network/user_service.dart';
import 'detailuser.dart';


class DataUser extends StatefulWidget {
  @override
  _DataUserState createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {
  String nama_lengkap = '';
  List<User> _user = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _getUser();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        nama_lengkap = user['nama_lengkap'];
      });
    }
  }

  _getUser() {
    UserService.getUser().then((user) {
      if (mounted) {
        setState(() {
          _user = user;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xff151515),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [

              SizedBox(
                height: 24,
              ),
              Text(
                "User Data",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              users(),
            ],
          ),
        ),
      ),
    );
  }

  Table users() {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
      children: [
        TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "ID",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "NAMA",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "AKSI",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ]),
        for (User user in _user)
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${user.id}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${user.nama_lengkap}",
              ),
            ),
            FlatButton(
              child: Icon(
                Icons.chevron_right,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailUser(
                      user: user,
                    ),
                  ),
                );
              },
            ),
          ]),
      ],
    );
  }
}