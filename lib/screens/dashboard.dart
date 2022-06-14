import 'package:flutter/material.dart';
import 'package:flutter_auth/BackgroundLogin/backgroundLogin.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/tambah_debitur.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/datanasabah.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/formaddnasabah.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/list_debitur.dart';
import 'package:flutter_auth/screens/Menu/about.dart';
import 'package:flutter_auth/screens/Menu/manual.dart';
import 'package:flutter_auth/screens/Menu/master_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/network/api.dart';
import 'dart:convert';
import 'Menu/DataNasabah/cari_semua_debitur.dart';
import 'login.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String nama_lengkap = '';
  String nama_grup = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    print(user);

    if (user != null) {
      setState(() {
        nama_lengkap = user['nama_lengkap'];
        nama_grup = user['grup']['nama_grup'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundLogin(
        child: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: <Widget>[
          // ClipPath(
          //   // clipper: ClippingClass(),
          //   child: Container(
          //     width: double.infinity,
          //     // height: MediaQuery.of(context).size.height*4/7,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [Color(0xff40dedf), Color(0xff0fb2ea)],
          //       ),
          //     ),
          //   ),
          // ),
          new Positioned(
            left: 20,
            top: 80,
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/images/home_images/user.png"),
            ),
          ),
          new Positioned(
            left: 20,
            top: 165,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Hello',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                    )),
                Text("${nama_lengkap} \nanda login sebagai ${nama_grup} ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
              ],
            ),
          ),
          new Positioned(
            left: 20,
            top: 280,
            right: 20,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _customCard(
                        imageUrl: "info.png",
                        item: "About",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Manuals()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _customCard(
                              imageUrl: "manuals.png",
                              item: "Manuals",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Positioned(
            left: 20,
            top: 480,
            right: 20,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TambahDebitur()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _customCard(
                        imageUrl: "tambah.png",
                        item: "Input Data",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CariDebitur()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _customCard(
                              imageUrl: "datanasabah.png",
                              item: "Nasabah",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }

  void logout() async {
    var res = await Network().getData('logout');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Login()));
    }
  }
}

_customCard({String imageUrl, String item}) {
  return SizedBox(
    height: 168,
    width: 150,
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/home_images/" + imageUrl),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var controlPoint = Offset(size.width - (size.width / 2), size.height - 120);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
