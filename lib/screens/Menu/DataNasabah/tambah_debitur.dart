// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth/screens/BottomBar/BottomBarMenu/scren3not.dart';
// import '../../../Models/mstdebitur.dart';
// import '../../../network/nasabah_service.dart';
// import '../../BottomBar/BottomBarMenu/cob2.dart';
//
// class TambahDebitur extends StatefulWidget {
//   TambahDebitur();
//   // const TambahDebitur({Key key}) : super(key: key);
//
//   @override
//   _TambahDebiturState createState() => _TambahDebiturState();
// }
//
// class _TambahDebiturState extends State<TambahDebitur> {
//   _TambahDebiturState();
//   final MstdebiturApiService api = MstdebiturApiService();
//   final _addFormKey = GlobalKey<FormState>();
//   final _iddebiturController = TextEditingController();
//   final _namadebiturController = TextEditingController();
//   final _alamatController = TextEditingController();
//   final _notelpController = TextEditingController();
//   final _noktpController = TextEditingController();
//   final _noselularController = TextEditingController();
//   LocalNotificationService service;
//
//   @override
//   void initState() {
//     service = LocalNotificationService();
//     service.intialize();
//     listenToNotification();
//     super.initState();
//   }
//
//   void _showNotification() async {
//     await service.showNotificationWithPayload(
//       id: 0,
//       title: 'Berhasil',
//       body: 'Data Nasabah Telah Ditambahkan',
//       payload: 'Halaman Notification',
//     );
//   }
//   // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   // FlutterLocalNotificationsPlugin();
//   // AndroidInitializationSettings androidInitializationSettings;
//   // IOSInitializationSettings iosInitializationSettings;
//   // InitializationSettings initializationSettings;
//   // //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   initializing();
//   // }
//   // //
//   // void _showNotification() async {
//   //   await notificationSchedule();
//   // }
//   //
//   // void initializing() async {
//   //   androidInitializationSettings = AndroidInitializationSettings('app_icon');
//   //   iosInitializationSettings = IOSInitializationSettings(
//   //       onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//   //   initializationSettings = InitializationSettings(
//   //       android: androidInitializationSettings, iOS: iosInitializationSettings);
//   //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//   //       onSelectNotification: onSelectNotification);
//   // }
//   //
//   // Future<void> notificationSchedule() async {
//   //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //       'your other channel id',
//   //       'your other channel name',
//   //       'your other channel description');
//   //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   //   NotificationDetails platformChannelSpecifics = NotificationDetails(
//   //       android: androidPlatformChannelSpecifics,
//   //       iOS: iOSPlatformChannelSpecifics);
//   //   await flutterLocalNotificationsPlugin.show(
//   //       0,
//   //       'Berhasil',
//   //       'Data telah ditambahkan',
//   //       // scheduledNotificationDateTime,
//   //       platformChannelSpecifics);
//   // }
//   //
//   // // ignore: missing_return
//   // Future onSelectNotification(String payLoad) {
//   //   if (payLoad != null) {
//   //     debugPrint("$payLoad");
//   //   }
//   //   print("Notification Tab");
//   //   Navigator.push(
//   //     context,
//   //     MaterialPageRoute(builder: (context) => Scren2(payload: payLoad)),
//   //   );
//   //   // If we tab in the notification we can set the nagivator to navigate to the next page,
//   // }
//   //
//   // Future onDidReceiveLocalNotification(
//   //     int id, String title, String body, String payload) async {
//   //   return showDialog(
//   //       context: context,
//   //       builder: (
//   //           BuildContext context,
//   //           ) =>
//   //           CupertinoAlertDialog(
//   //             title: Text(title),
//   //             content: Text(body),
//   //             actions: <Widget>[
//   //               CupertinoDialogAction(
//   //                 isDefaultAction: true,
//   //                 child: Text("Okay"),
//   //                 onPressed: () {
//   //                   // naviagate to desire page
//   //                 },
//   //               )
//   //             ],
//   //           ));
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tambah Data Nasabah'),
//       ),
//       body: Form(
//           key: _addFormKey,
//           child: SingleChildScrollView(
//               child: Column(children: <Widget>[
//             Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       Card(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             ListTile(
//                               leading: Icon(Icons.info, size: 50),
//                               title: Text('Form Debitur'),
//                               subtitle:
//                                   Text("Silahkan isi sesuai form dibawah ini"),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               controller: _namadebiturController,
//                               decoration: InputDecoration(
//                                 labelText: 'Nama Debitur',
//                                 border: OutlineInputBorder(),
//                               ),
//                               validator: (value) {
//                                 if (value.isEmpty) {
//                                   return 'Nama Debitur tidak boleh kosong';
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {},
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               controller: _alamatController,
//                               decoration: InputDecoration(
//                                 labelText: 'Alamat',
//                                 border: OutlineInputBorder(),
//                               ),
//                               validator: (value) {
//                                 if (value.isEmpty) {
//                                   return 'Alamat tidak boleh kosong';
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {},
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               controller: _noktpController,
//                               decoration: InputDecoration(
//                                 labelText: 'No Ktp',
//                                 border: OutlineInputBorder(),
//                               ),
//                               validator: (value) {
//                                 if (value.isEmpty) {
//                                   return 'No Ktp tidak boleh kosong';
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {},
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               controller: _notelpController,
//                               decoration: InputDecoration(
//                                 labelText: 'No Telp',
//                                 border: OutlineInputBorder(),
//                               ),
//                               validator: (value) {
//                                 if (value.isEmpty) {
//                                   return 'No Telp tidak boleh kosong';
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {},
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               controller: _noselularController,
//                               decoration: InputDecoration(
//                                 labelText: 'No Selular',
//                                 border: OutlineInputBorder(),
//                               ),
//                               validator: (value) {
//                                 if (value.isEmpty) {
//                                   return 'No Selular tidak boleh kosong';
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {},
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.centerRight,
//                         margin: EdgeInsets.all(10),
//                         child: RaisedButton(
//                           onPressed: () {
//                             if (_addFormKey.currentState.validate()) {
//                               _addFormKey.currentState?.save();
//                               api.createNasabah(
//                                 Mstdebitur(
//                                   nama_debitur: _namadebiturController.text,
//                                   alamat: _alamatController.text,
//                                   no_telp: _notelpController.text,
//                                   relationship: _noktpController.text,
//                                   no_selular: _noselularController.text,
//                                 ),
//                               );
//                               Navigator.pop(context);
//                             }
//                             _showNotification();
//                           },
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(80.0)),
//                           padding: EdgeInsets.all(0.0),
//                           child: Ink(
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Color(0xFFFF5722),
//                                     Color(0xFFFF8A65)
//                                   ],
//                                   begin: Alignment.centerLeft,
//                                   end: Alignment.centerRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(30.0)),
//                             child: Container(
//                               constraints: BoxConstraints(
//                                   maxWidth: 100.0, minHeight: 50.0),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "Tambah",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ]))
//           ]))),
//     );
//   }
//
//   void listenToNotification() =>
//       service.onNotificationClick.stream.listen(onNotificationListener);
//
//   void onNotificationListener(String payload) {
//     if (payload != null && payload.isNotEmpty) {
//       print('payload $payload');
//       if (mounted)
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Scren3(payload: payload)),
//           );
//         });
//     }
//   }
// }
