// import 'package:flutter/material.dart';
//
// import '../../../Models/mstdebitur.dart';
// import '../../../network/nasabah_service.dart';
//
// class EditDebitur extends StatefulWidget {
//   final Mstdebitur mstdebitur;
//
//   EditDebitur(this.mstdebitur, {Key key}) : super(key: key);
//
//   @override
//   _EditDebiturState createState() => _EditDebiturState();
// }
//
// class _EditDebiturState extends State<EditDebitur> {
//   _EditDebiturState();
//   final MstdebiturApiService api = MstdebiturApiService();
//
//   final _editFormKey = GlobalKey<FormState>();
//   final _iddebiturController = TextEditingController();
//   final _namadebiturController = TextEditingController();
//   final _alamatController = TextEditingController();
//   final _notelpController = TextEditingController();
//   final _noktpController = TextEditingController();
//   final _noselularController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _namadebiturController.text = widget.mstdebitur.namaDebitur;
//     _alamatController.text = widget.mstdebitur.alamat;
//     _notelpController.text = widget.mstdebitur.noTelp;
//     _noktpController.text = widget.mstdebitur.relationship;
//     _noselularController.text = widget.mstdebitur.noSeluler;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Data Nasabah'),
//       ),
//       body: Form(
//         key: _editFormKey,
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             child: Card(
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 width: 440,
//                 child: Column(
//                   children: <Widget>[
//                     Card(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           ListTile(
//                             leading: Icon(Icons.info, size: 50),
//                             title: Text('Form Debitur'),
//                             subtitle:
//                                 Text("Silahkan edit sesuai form dibawah ini"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                       child: Column(
//                         children: <Widget>[
//                           TextFormField(
//                             controller: _namadebiturController,
//                             decoration: InputDecoration(
//                               labelText: 'Nama Debitur',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'Nama Debitur tidak boleh kosong';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                       child: Column(
//                         children: <Widget>[
//                           TextFormField(
//                             controller: _alamatController,
//                             decoration: InputDecoration(
//                               labelText: 'Alamat',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'Alamat tidak boleh kosong';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                       child: Column(
//                         children: <Widget>[
//                           TextFormField(
//                             controller: _noktpController,
//                             decoration: InputDecoration(
//                               labelText: 'No Ktp',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'No Ktp tidak boleh kosong';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                       child: Column(
//                         children: <Widget>[
//                           TextFormField(
//                             controller: _notelpController,
//                             decoration: InputDecoration(
//                               labelText: 'No Telp',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'No Telp tidak boleh kosong';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                       child: Column(
//                         children: <Widget>[
//                           TextFormField(
//                             controller: _noselularController,
//                             decoration: InputDecoration(
//                               labelText: 'No Selular',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'No Selular tidak boleh kosong';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             alignment: Alignment.centerRight,
//                             margin: EdgeInsets.all(10),
//                             child: RaisedButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 if (_editFormKey.currentState.validate()) {
//                                   _editFormKey.currentState?.save();
//                                   api.updateDebitur(
//                                       widget.mstdebitur.nik,
//                                       Mstdebitur(
//                                         namaDebitur:
//                                             _namadebiturController.text,
//                                         alamat: _alamatController.text,
//                                         noTelp: _notelpController.text,
//                                         relationship: _noktpController.text,
//                                         noSeluler: _noselularController.text,
//                                       ));
//                                 }
//                                 Navigator.pop(context);
//                               },
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(80.0)),
//                               padding: EdgeInsets.all(0.0),
//                               child: Ink(
//                                 decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         Color(0xFFFF5722),
//                                         Color(0xFFFF8A65)
//                                       ],
//                                       begin: Alignment.centerLeft,
//                                       end: Alignment.centerRight,
//                                     ),
//                                     borderRadius: BorderRadius.circular(30.0)),
//                                 child: Container(
//                                   constraints: BoxConstraints(
//                                       maxWidth: 100.0, minHeight: 50.0),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     "Edit",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 15),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           // RaisedButton(
//                           //   splashColor: Colors.red,
//                           //   color: Colors.blue,
//                           //   child: Text('Edit Data'),
//                           //   onPressed: () {
//                           //     if (_editFormKey.currentState.validate()) {
//                           //       _editFormKey.currentState?.save();
//                           //
//                           //       api.updateNasabah(
//                           //           widget.nasabah.id,
//                           //           Nasabah(
//                           //             nama_debitur: _namadebiturController.text,
//                           //             alamat: _alamatController.text,
//                           //             no_telp: _notelpController.text,
//                           //             no_ktp: _noktpController.text,
//                           //             no_selular: _noselularController.text,
//                           //           ));
//                           //     }
//                           //     Navigator.of(context).pushNamed('/');
//                           //   },
//                           // )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
