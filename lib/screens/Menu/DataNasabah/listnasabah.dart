// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Models/nasabah.dart';
// import 'package:flutter_auth/network/nasabah_service.dart';
// import 'package:flutter_auth/screens/Menu/DataNasabah/datanasabah.dart';
// import 'package:flutter_auth/screens/Menu/DataNasabah/detailnasabah.dart';
//
//
// class ListNasabah {
//   ApiService apiService;
//   ListNasabah({this.apiService});
//
//   void getNasabah() {
//     apiService.getNasabah().then((nasabah) {
//       print(nasabah);
//     });
//   }
//
//   Widget createViewList() {
//     return SafeArea(
//       child: FutureBuilder(
//         future: apiService.getNasabah(),
//         builder: (BuildContext context, AsyncSnapshot<List<Nasabah>> snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 'Something wrong with message: ${snapshot.error.toString()}',
//                 textAlign: TextAlign.center,
//               ),
//             );
//           } else if (snapshot.connectionState == ConnectionState.done) {
//             List<Nasabah> nasabah = snapshot.data;
//             return nasabahListView(nasabah);
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Widget nasabahListView(List<Nasabah> listnasabah) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           Nasabah nasabah = listnasabah[index];
//           return Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Card(
//               shape: Border(left: BorderSide(color: Colors.green, width: 5)),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       nasabah.nama_debitur,
//                       style: Theme.of(context).textTheme.bodyText1,
//                     ),
//                     Text(nasabah.alamat),
//                     Text(nasabah.no_ktp),
//                     Text(nasabah.no_telp),
//                     Text(nasabah.no_selular),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) => AlertDialog(
//                                 title: Text('Hapus Data Nasabah'),
//                                 content: Text(
//                                     'Apakah anda yakin ingin menghapus data nasabah ini?'),
//                                 actions: [
//                                   TextButton(
//                                       child: Text('Yes'),
//                                       onPressed: () async {
//                                         apiService
//                                             .deleteNasabah(nasabah.id)
//                                             .then((value) => Navigator.of(
//                                                     context)
//                                                 .pushReplacement(
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             DataNasabah())));
//                                       })
//                                 ],
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.red,
//                           ),
//                           icon: Icon(Icons.delete),
//                           label: Text('Hapus'),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         // ElevatedButton.icon(
//                         //   onPressed: () async {
//                         //     var result = await Navigator.push(context,
//                         //         MaterialPageRoute(builder: (context) {
//                         //           return FormAddNasabah(
//                         //             nasabah: nasabah,
//                         //           );
//                         //         }));
//                         //   },
//                         //   style: ElevatedButton.styleFrom(
//                         //     primary: Colors.blue,
//                         //   ),
//                         //   icon: Icon(Icons.edit),
//                         //   label: Text('Edit',),
//                         // ),
//                         // SizedBox(
//                         //   width : 5,
//                         // ),
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => DetailNasabah(
//                                   nasabah: nasabah,
//                                 ),
//                               ),
//                             );
//                           },
//                           icon: Icon(Icons.navigate_next),
//                           label: Text(
//                             'Detail',
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         itemCount: listnasabah.length,
//       ),
//     );
//   }
// }
