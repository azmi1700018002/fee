import 'package:flutter/material.dart';
import '../../../Models/nasabah.dart';
import '../../../network/nasabah_service.dart';

class TambahDebitur extends StatefulWidget {
  TambahDebitur();

  @override
  _TambahDebiturState createState() => _TambahDebiturState();
}

class _TambahDebiturState extends State<TambahDebitur> {
  _TambahDebiturState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _iddebiturController = TextEditingController();
  final _namadebiturController = TextEditingController();
  final _alamatController = TextEditingController();
  final _notelpController = TextEditingController();
  final _noktpController = TextEditingController();
  final _noselularController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Nasabah'),
      ),
      body: Form(
          key: _addFormKey,
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.info, size: 50),
                              title: Text('Form Debitur'),
                              subtitle:
                                  Text("Silahkan isi sesuai form dibawah ini"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Nama Debitur'),
                            TextFormField(
                              controller: _namadebiturController,
                              decoration: InputDecoration(
                                hintText: 'Nama Debitur',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Nama Debitur tidak boleh kosong';
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Alamat'),
                            TextFormField(
                              controller: _alamatController,
                              decoration: InputDecoration(
                                hintText: 'Alamat',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Alamat tidak boleh kosong';
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('No Ktp'),
                            TextFormField(
                              controller: _noktpController,
                              decoration: InputDecoration(
                                hintText: 'No Ktp',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'No Ktp tidak boleh kosong';
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('No Telp'),
                            TextFormField(
                              controller: _notelpController,
                              decoration: InputDecoration(
                                hintText: 'No Telp',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'No Telp tidak boleh kosong';
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('No Selular'),
                            TextFormField(
                              controller: _noselularController,
                              decoration: InputDecoration(
                                hintText: 'No Selular',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'No Selular tidak boleh kosong';
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.all(10),
                        child: RaisedButton(
                          onPressed: () {
                            if (_addFormKey.currentState.validate()) {
                              _addFormKey.currentState?.save();
                              api.createNasabah(
                                Nasabah(
                                  nama_debitur: _namadebiturController.text,
                                  alamat: _alamatController.text,
                                  no_telp: _notelpController.text,
                                  no_ktp: _noktpController.text,
                                  no_selular: _noselularController.text,
                                ),
                              );
                            }
                            Navigator.pop(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFF5722),
                                    Color(0xFFFF8A65)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 100.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Tambah",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]))
          ]))),
    );
  }
}
