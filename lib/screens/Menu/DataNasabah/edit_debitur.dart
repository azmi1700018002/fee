import 'package:flutter/material.dart';

import '../../../Models/nasabah.dart';
import '../../../network/nasabah_service.dart';

class EditDebitur extends StatefulWidget {
  final Nasabah nasabah;

  EditDebitur(this.nasabah, {Key key}) : super(key: key);

  @override
  _EditDebiturState createState() => _EditDebiturState();
}

class _EditDebiturState extends State<EditDebitur> {
  _EditDebiturState();
  final ApiService api = ApiService();

  final _editFormKey = GlobalKey<FormState>();
  final _iddebiturController = TextEditingController();
  final _namadebiturController = TextEditingController();
  final _alamatController = TextEditingController();
  final _notelpController = TextEditingController();
  final _noktpController = TextEditingController();
  final _noselularController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namadebiturController.text = widget.nasabah.nama_debitur;
    _alamatController.text = widget.nasabah.alamat;
    _notelpController.text = widget.nasabah.no_telp;
    _noktpController.text = widget.nasabah.no_ktp;
    _noselularController.text = widget.nasabah.no_selular;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Nasabah'),
      ),
      body: Form(
        key: _editFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: 440,
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.info, size: 50),
                            title: Text('Form Debitur'),
                            subtitle:
                                Text("Silahkan edit sesuai form dibawah ini"),
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
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.all(10),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                if (_editFormKey.currentState.validate()) {
                                  _editFormKey.currentState?.save();
                                  api.updateNasabah(
                                      widget.nasabah.id,
                                      Nasabah(
                                        nama_debitur:
                                            _namadebiturController.text,
                                        alamat: _alamatController.text,
                                        no_telp: _notelpController.text,
                                        no_ktp: _noktpController.text,
                                        no_selular: _noselularController.text,
                                      ));
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
                                    "Edit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // RaisedButton(
                          //   splashColor: Colors.red,
                          //   color: Colors.blue,
                          //   child: Text('Edit Data'),
                          //   onPressed: () {
                          //     if (_editFormKey.currentState.validate()) {
                          //       _editFormKey.currentState?.save();
                          //
                          //       api.updateNasabah(
                          //           widget.nasabah.id,
                          //           Nasabah(
                          //             nama_debitur: _namadebiturController.text,
                          //             alamat: _alamatController.text,
                          //             no_telp: _notelpController.text,
                          //             no_ktp: _noktpController.text,
                          //             no_selular: _noselularController.text,
                          //           ));
                          //     }
                          //     Navigator.of(context).pushNamed('/');
                          //   },
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
