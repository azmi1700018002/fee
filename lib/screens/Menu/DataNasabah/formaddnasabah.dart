// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Models/nasabah.dart';
// import 'package:flutter_auth/network/nasabah_service.dart';
// import 'package:flutter_auth/screens/Menu/DataNasabah/datanasabah.dart';
//
// class FormAddNasabah extends StatefulWidget {
//   Nasabah nasabah;
//   FormAddNasabah({this.nasabah});
//   @override
//   _FormAddNasabahState createState() => _FormAddNasabahState();
// }
//
// class _FormAddNasabahState extends State<FormAddNasabah> {
//   ApiService apiService;
//   TextEditingController _contNama = TextEditingController();
//   TextEditingController _contAlamat = TextEditingController();
//   TextEditingController _contNoTelp = TextEditingController();
//   TextEditingController _contNoKtp = TextEditingController();
//   TextEditingController _contNoSelular = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     apiService = ApiService();
//     if (widget.nasabah != null) {
//       _contNama.text = widget.nasabah.nama_debitur;
//       _contAlamat.text = widget.nasabah.alamat;
//       _contNoTelp.text = widget.nasabah.no_telp;
//       _contNoKtp.text = widget.nasabah.no_ktp;
//       _contNoSelular.text = widget.nasabah.no_selular;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.white),
//           title: Text(
//             widget.nasabah == null ? "Tambah Nasabah" : "Edit Nasabah",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Card(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           ListTile(
//                             leading: Icon(Icons.info, size: 50),
//                             title: Text('Form Debitur'),
//                             subtitle: Text(
//                               widget.nasabah == null
//                                   ? "Silahkan isi sesuai form dibawah ini"
//                                   : "Silahkan edit sesuai form dibawah ini",
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     _buildTextField(_contNama, "Nama Nasabah"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     _buildTextField(_contAlamat, "Alamat"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     _buildTextField(_contNoTelp, "No Telp"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     _buildTextField(_contNoKtp, "No KTP"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     _buildTextField(_contNoSelular, "No Selular"),
//                     Container(
//                       alignment: Alignment.centerRight,
//                       margin: EdgeInsets.all(10),
//                       child: RaisedButton(
//                         onPressed: () {
//                           int id = 0;
//                           if (widget.nasabah != null) {
//                             id = widget.nasabah.id;
//                           }
//                           Nasabah nasabah = Nasabah(
//                               id: id,
//                               nama_debitur: _contNama.text,
//                               alamat: _contAlamat.text,
//                               no_telp: _contNoTelp.text,
//                               no_ktp: _contNoKtp.text,
//                               no_selular: _contNoSelular.text);
//
//                           if (widget.nasabah == null) {
//                             apiService.createNasabah(nasabah);
//                           } else {
//                             apiService.updateNasabah(nasabah);
//                           }
//                           Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) {
//                             return DataNasabah();
//                           }));
//                         },
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(80.0)),
//                         padding: EdgeInsets.all(0.0),
//                         child: Ink(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [Color(0xFFFF5722), Color(0xFFFF8A65)],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(30.0)),
//                           child: Container(
//                             constraints: BoxConstraints(
//                                 maxWidth: 100.0, minHeight: 50.0),
//                             alignment: Alignment.center,
//                             child: Text(
//                               widget.nasabah == null ? "Tambah" : "Edit",
//                               textAlign: TextAlign.center,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(top: 8.0),
//                     //   child: RaisedButton(
//                     //     child: Text(widget.nasabah == null ? "Tambah" : "Edit"),
//                     //     color: Colors.orange,
//                     //     textColor: Colors.white,
//                     //     onPressed: () {
//                     //       int id = 0;
//                     //       if (widget.nasabah != null) {
//                     //         id = widget.nasabah.id;
//                     //       }
//                     //       Nasabah nasabah = Nasabah(
//                     //           id: id,
//                     //           nama_debitur: _contNama.text,
//                     //           alamat: _contAlamat.text,
//                     //           no_telp: _contNoTelp.text,
//                     //           no_ktp: _contNoKtp.text,
//                     //           no_selular: _contNoSelular.text);
//                     //
//                     //       if (widget.nasabah == null) {
//                     //         apiService.createNasabah(nasabah);
//                     //       } else {
//                     //         apiService.updateNasabah(nasabah);
//                     //       }
//                     //       Navigator.of(context).pushReplacement(
//                     //           MaterialPageRoute(builder: (BuildContext context) {
//                     //         return DataNasabah();
//                     //       }));
//                     //     },
//                     //   ),
//                     // )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
//
//   Widget _buildTextField(TextEditingController _cont, String label) {
//     return TextField(
//       controller: _cont,
//       keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
// }
