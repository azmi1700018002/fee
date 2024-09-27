import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/mstdebitur.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/input_agunan/list_pengajuan_debitur.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/pengajuan_kredit/t_datamasterdebitur.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/upload_berkas/list_pengajuan_debitur.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/network/api.dart';
import 'dart:convert';
import 'Menu/DataNasabah/analisa _pengajuan_kredit/list_pengajuan_debitur.dart';
import 'Menu/DataNasabah/review_hasil_analisa/cari_semua_debitur.dart';
import 'login.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final nasabahSave = new Mstdebitur();
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
    return Scaffold(
        body: Stack(
          fit: StackFit.loose,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 7 / 7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff01579b), Color(0xff0fb2ea)],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/home_images/user.png"),
                    ),
                  ),
                  Text('Selamat Datang\n${nama_lengkap} ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19, fontWeight: FontWeight.bold
                      )),
                      SizedBox(
                        width: 137,
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      )
                ]),
                // Text(" anda login sebagai ${nama_grup} ",
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 18,
                //     )),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                T_DataMasterDebitur(mstdebitur: nasabahSave)))
                  },
                  child: Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.send_and_archive,
                                color: Colors.blue.shade400,
                              )),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pengajuan Kredit",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("Input data calon debitur/debitur"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListPengajuanUploadBerkas()))
                  },
                  child: Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.upload,
                                color: Colors.red.shade400,
                              )),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Upload Berkas",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "Upload berkas atau dokumen pendukung pada debitur"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListPengajuanInputAgunan()))
                  },
                  child: Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.input,
                                color: Colors.blue.shade900,
                              )),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Input Agunan",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("Input data agunan pada debitur"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListPengajuanAnalisaKredit()))
                  },
                  child: Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.analytics,
                                color: Colors.orange.shade400,
                              )),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Analisa Pengajuan Kredit",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "Input data analisa pengajuan kredit pada debitur"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CariDebitur()))
                  },
                  child: Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.reviews,
                                color: Colors.green.shade800,
                              )),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Review Hasil Analisa",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "Hasil pengajuan dari debitur yang telah di inputkan"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
