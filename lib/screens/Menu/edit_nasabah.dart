// import 'package:flutter/material.dart';
// import 'package:flutter_auth/network/api.dart';
// import 'package:flutter_auth/network/nasabah_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import '../../Models/nasabah.dart';
//
// class EditNasabah extends StatefulWidget {
//   Nasabah nasabah;
//   EditNasabah({this.nasabah});
//   @override
//   _EditNasabahState createState() => _EditNasabahState(this.nasabah);
// }
//
// class _EditNasabahState extends State<EditNasabah> {
//   bool _isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   final Nasabah nasabah;
//   _EditNasabahState(this.nasabah);
//   bool _secureText = true;
//   final TextEditingController _nama_debiturController = TextEditingController();
//   final TextEditingController _alamatController = TextEditingController();
//   final TextEditingController _no_telpController = TextEditingController();
//   final TextEditingController _no_ktpController = TextEditingController();
//   final TextEditingController _no_selularController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _nama_debiturController.text = nasabah.nama_debitur;
//     _alamatController.text = nasabah.alamat;
//     _no_telpController.text = nasabah.no_telp;
//     _no_ktpController.text = nasabah.no_ktp;
//     _no_selularController.text = nasabah.no_selular;
//   }
//
//   @override
//   void dispose() {
//     _nama_debiturController.dispose();
//     _alamatController.dispose();
//     _no_telpController.dispose();
//     _no_ktpController.dispose();
//     _no_selularController.dispose();
//     super.dispose();
//   }
//
//   showHide() {
//     setState(() {
//       _secureText = !_secureText;
//     });
//   }
//
//   _showMsg(msg) {
//     final snackBar = SnackBar(
//       content: Text(msg),
//     );
//     _scaffoldKey.currentState.showSnackBar(snackBar);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Edit Data"),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(10),
//           child: ListView(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               Card(
//                 child: Column(
//
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     const ListTile(
//                       leading: Icon(Icons.info, size: 50),
//                       title: Text('Edit Form Debitur'),
//                       subtitle: Text('Silahkan edit sesuai form dibawah ini'),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _nama_debiturController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Nama Debitur',
//                       ),
//                       validator: (nameValue) {
//                         if (nameValue.isEmpty) {
//                           return 'Please enter your full name';
//                         }
//                         nasabah.nama_debitur = nameValue;
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _alamatController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Alamat',
//                       ),
//                       validator: (alamatValue) {
//                         if (alamatValue.isEmpty) {
//                           return 'Please enter your full name';
//                         }
//                         nasabah.alamat = alamatValue;
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _no_telpController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Nomor Telepon',
//                       ),
//                       validator: (notlpValue) {
//                         if (notlpValue.isEmpty) {
//                           return 'Please enter your full name';
//                         }
//                         nasabah.no_telp = notlpValue;
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _no_ktpController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'NIK',
//                       ),
//                       validator: (noktpValue) {
//                         if (noktpValue.isEmpty) {
//                           return 'Please enter your full name';
//                         }
//                         nasabah.no_ktp = noktpValue;
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _no_selularController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'No Selular',
//                       ),
//                       validator: (nosllValue) {
//                         if (nosllValue.isEmpty) {
//                           return 'Please enter your full name';
//                         }
//                         nasabah.no_selular = nosllValue;
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       alignment: Alignment.centerRight,
//                       margin: EdgeInsets.all(10),
//                       child: RaisedButton(
//                         onPressed: () {
//                           if (_formKey.currentState.validate()) {
//                             _update();
//                           }
//                         },
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(80.0)),
//                         padding: EdgeInsets.all(0.0),
//                         child: Ink(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [Color(0xff374ABE), Color(0xff64B6FF)],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(30.0)),
//                           child: Container(
//                             constraints:
//                             BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
//                             alignment: Alignment.center,
//                             child: Text(
//                               _isLoading? 'Proccessing..' : 'Simpan',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(color: Colors.white, fontSize: 15),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         ));
//   }
//
//   void _update() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     var data = {
//       "nama_debitur" : _nama_debiturController.text,
//       "alamat" : _alamatController.text,
//       "no_telp" : _no_telpController.text,
//       "no_ktp" : _no_ktpController.text,
//       "no_selular" : _no_selularController.text
//     };
//     print(data);
//
//     var res = await Network().updateData(NasabahService.baseUrl, 'mstdebitur' , data);
//     var body = json.decode(res.body);
//     if (res.statusCode == 200) {
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       localStorage.setString('mstdebitur', json.encode(body['mstdebitur']));
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Berhasil Disimpan'),
//         duration: Duration(seconds: 2),
//       ));
//
//     } else {
//       // if (body['message']['nama_debitur'] != null) {
//       //   _showMsg(body['message']['nama_debitur'][0].toString());
//       // } else if (body['message']['alamat'] != null) {
//       //   _showMsg(body['message']['alamat'][0].toString());
//       // } else if (body['message']['no_telp'] != null) {
//       //   _showMsg(body['message']['no_telp'][0].toString());
//       // }
//       // else if (body['message']['no_ktp'] != null) {
//       //   _showMsg(body['message']['no_ktp'][0].toString());
//       // }
//       // else if (body['message']['no_selular'] != null) {
//       //   _showMsg(body['message']['no_selular'][0].toString());
//       // }
//       // ScaffoldMessenger.of(context)
//       //     .showSnackBar(new SnackBar(content: Text("Gagal")));
//     }
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }