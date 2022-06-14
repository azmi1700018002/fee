// import 'package:flutter/material.dart';
// import 'package:flutter_auth/network/nasabah_service.dart';
// import 'package:flutter_auth/screens/Menu/DataNasabah/detailnasabah.dart';
// import 'package:search_page/search_page.dart';
// import '../../../Models/nasabah.dart';
// import 'listnasabah.dart';
//
// GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
//
// class DataNasabah extends StatefulWidget {
//   DataNasabah({Key key}) : super(key: key);
//   final String title = "Data Nasabah";
//
//   @override
//   _DataNasabahState createState() => _DataNasabahState();
// }
//
// class _DataNasabahState extends State<DataNasabah> {
//   ApiService apiService;
//   ListNasabah _listNasabah;
//   bool _isLoading = true;
//   List<Nasabah> data = <Nasabah>[];
//   final _textHeadStyle =
//       TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
//
//   void fetchData() async { //method ini diperbaiki , gunakan FutureBuilder saja saat panggil method ini
//     final res = await apiService.getNasabah();
//     data = res;
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     apiService = ApiService();
//     _listNasabah = new ListNasabah(apiService: apiService);
//     fetchData(); //disini
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // extendBodyBehindAppBar: true,
//       key: _scaffoldState,
//       appBar: AppBar(
//         title: Text(
//           'Data Nasabah',
//         ),
//         // backgroundColor: Colors.transparent,
//         // elevation: 0,
//         actions: <Widget>[
//           TextButton(
//             child: Icon(Icons.search,
//             color: Colors.white,),
//               // tooltip: 'Search people',
//               onPressed: () => showSearch(
//                   context: context,
//                   delegate: SearchPage<Nasabah>(
//                       onQueryUpdate: (s) => print(s),
//                       items: data,
//                       searchLabel: 'Cari Nasabah',
//                       suggestion: Center(
//                         child: Text('Cari nasabah berdasarkan nama, alamat, ktp'),
//                       ),
//                       failure: Center(
//                         child: Text('Nasabah tidak ditemukan :('),
//                       ),
//                       filter: (data) => [
//                             data.nama_debitur,
//                             data.alamat,
//                             data.no_ktp.toString(),
//                           ],
//                       builder: (data) => Card(
//                         shape: Border(left: BorderSide(color: Colors.green, width: 5)),
//                           child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     ListTile(
//                                       title: Text(data.nama_debitur),
//                                       subtitle: Text(data.alamat),
//                                       trailing: Text('${data.no_ktp}'),
//                                     ),
//                                     Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: <Widget>[
//                                           ElevatedButton.icon(
//                                             onPressed: () {
//                                               showDialog(
//                                                 context: context,
//                                                 builder: (context) =>
//                                                     AlertDialog(
//                                                   title: Text(
//                                                       'Hapus Data Nasabah'),
//                                                   content: Text(
//                                                       'Apakah anda yakin ingin menghapus data nasabah ini?'),
//                                                   actions: [
//                                                     TextButton(
//                                                         child: Text('Yes'),
//                                                         onPressed: () async {
//                                                           apiService
//                                                               .deleteNasabah(
//                                                                   data.id)
//                                                               .then((value) => Navigator
//                                                                       .of(
//                                                                           context)
//                                                                   .pushReplacement(
//                                                                       MaterialPageRoute(
//                                                                           builder: (context) =>
//                                                                               DataNasabah())));
//                                                         })
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Colors.red,
//                                             ),
//                                             icon: Icon(Icons.delete),
//                                             label: Text('Hapus'),
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           ElevatedButton.icon(
//                                             onPressed: () {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       DetailNasabah(
//                                                     nasabah: data,
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                             icon: Icon(Icons.navigate_next),
//                                             label: Text(
//                                               'Detail',
//                                             ),
//                                           )
//                                         ])
//                                   ]
//                               ),
//                           ),
//                       ),
//                   )
//               ),
//           )
//
//           // GestureDetector(
//           //   onTap: () async {
//           //     var result = await Navigator.push(
//           //       _scaffoldState.currentContext,
//           //       MaterialPageRoute(builder: (BuildContext context) {
//           //         return FormAddNasabah(nasabah: null);
//           //       }),
//           //     );
//           //     if (result != null) {
//           //       setState(() {});
//           //     }
//           //   },
//           //   child: Padding(
//           //     padding: const EdgeInsets.only(right: 16.0),
//           //     child: Icon(
//           //       Icons.add,
//           //       color: Colors.white,
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//       body: _listNasabah.createViewList(),
//     );
//   }
// }
