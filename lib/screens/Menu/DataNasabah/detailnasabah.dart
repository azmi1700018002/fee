// import 'package:accordion/accordion.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Models/nasabah.dart';
// import 'package:flutter_auth/screens/Menu/DataNasabah/formaddnasabah.dart';
//
// class DetailNasabah extends StatefulWidget {
//   Nasabah nasabah;
//   DetailNasabah({this.nasabah});
//   @override
//   _DetailNasabahState createState() => _DetailNasabahState(this.nasabah);
// }
//
// class _DetailNasabahState extends State<DetailNasabah> {
//   final _textHeadStyle =
//       TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
//   final _textContenStyle = TextStyle(
//     color: Colors.black,
//     fontSize: 18,
//   );
//   final Nasabah nasabah;
//   _DetailNasabahState(this.nasabah);
//   bool _isVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void showToast() {
//     setState(() {
//       _isVisible = !_isVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Detail Nasabah'),
//         backgroundColor: Color(0xff151515),
//       ),
//       body: Accordion(
//           maxOpenSections: 4,
//           headerBorderRadius: 20,
//           contentBorderColor: Colors.grey,
//           headerBackgroundColorOpened: Colors.green,
//           headerBackgroundColor: Color(0xFFF9A825),
//           headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
//           children: [
//             AccordionSection(
//               isOpen: false,
//               leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
//               header: Text(
//                 'Data Debitur',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               content: Column(children: [
//                 Row(children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text('Nama Debitur :', style: _textHeadStyle),
//                   ),
//                   Text(
//                     nasabah.nama_debitur.toString(),
//                     style: _textContenStyle,
//                   ),
//                 ]),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Row(children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Alamat :',
//                       style: _textHeadStyle,
//                     ),
//                   ),
//                   Text(
//                     nasabah.alamat.toString(),
//                     style: _textContenStyle,
//                   ),
//                 ]),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Row(children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'no telp :',
//                       style: _textHeadStyle,
//                     ),
//                   ),
//                   Text(
//                     nasabah.no_telp.toString(),
//                     style: _textContenStyle,
//                   ),
//                 ]),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Row(children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'no ktp :',
//                       style: _textHeadStyle,
//                     ),
//                   ),
//                   Text(
//                     nasabah.no_ktp.toString(),
//                     style: _textContenStyle,
//                   ),
//                 ]),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Row(children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'no seluler :',
//                       style: _textHeadStyle,
//                     ),
//                   ),
//                   Text(
//                     nasabah.no_selular.toString(),
//                     style: _textContenStyle,
//                   ),
//                 ]),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: ElevatedButton.icon(
//                     onPressed: () async {
//                       var result = await Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return FormAddNasabah(
//                           nasabah: nasabah,
//                         );
//                       }));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.orange,
//                     ),
//                     icon: Icon(Icons.edit),
//                     label: Text(
//                       'Edit',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//               ]),
//             ),
//             AccordionSection(
//               isOpen: false,
//               leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
//               header: Text(
//                 'Data Kredit Mikro',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               content: Column(children: [
//                 Text(nasabah.nama_debitur.toString()),
//                 Text(nasabah.alamat.toString()),
//                 Text(nasabah.no_telp.toString()),
//                 Text(nasabah.no_ktp.toString()),
//                 Text(nasabah.no_selular.toString()),
//               ]),
//             )
//           ]),
//     );
//   }
// }
//
