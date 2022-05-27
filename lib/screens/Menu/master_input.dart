import 'package:flutter/material.dart';
import 'package:flutter_auth/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class cob2 extends StatefulWidget {
  @override
  _cob2State createState() => _cob2State();
}

class _cob2State extends State<cob2> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;
  String nama_debitur, alamat, no_telp, no_ktp, no_selular;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NIK"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.info, size: 50),
                      title: Text('Form Debitur'),
                      subtitle: Text('Silahkan isi sesuai form dibawah ini'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nama Debitur',
                        ),
                        validator: (nameValue) {
                          if (nameValue.isEmpty) {
                            return 'Please enter your full name';
                          }
                          nama_debitur = nameValue;
                          return null;
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Alamat',
                        ),
                        validator: (alamatValue) {
                          if (alamatValue.isEmpty) {
                            return 'Please enter your full name';
                          }
                          alamat = alamatValue;
                          return null;
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nomor Telepon',
                        ),
                        validator: (notlpValue) {
                          if (notlpValue.isEmpty) {
                            return 'Please enter your full name';
                          }
                          no_telp = notlpValue;
                          return null;
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'NIK',
                        ),
                        validator: (noktpValue) {
                          if (noktpValue.isEmpty) {
                            return 'Please enter your full name';
                          }
                          no_ktp = noktpValue;
                          return null;
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'No Selular',
                        ),
                        validator: (nosllValue) {
                          if (nosllValue.isEmpty) {
                            return 'Please enter your full name';
                          }
                          no_selular = nosllValue;
                          return null;
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _register();
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints:
                            BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              _isLoading? 'Proccessing..' : 'Simpan',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ));
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'nama_debitur': nama_debitur, 'alamat': alamat, 'no_telp': no_telp, 'no_ktp': no_ktp, 'no_selular': no_selular};

    print(data);

    var res = await Network().auth(data, 'mstdebitur');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('mstdebitur', json.encode(body['mstdebitur']));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Berhasil Disimpan'),
        duration: Duration(seconds: 2),
      ));

    } else {
      if (body['message']['nama_debitur'] != null) {
        _showMsg(body['message']['nama_debitur'][0].toString());
      } else if (body['message']['alamat'] != null) {
        _showMsg(body['message']['alamat'][0].toString());
      } else if (body['message']['no_telp'] != null) {
        _showMsg(body['message']['no_telp'][0].toString());
      }
      else if (body['message']['no_ktp'] != null) {
        _showMsg(body['message']['no_ktp'][0].toString());
      }
      else if (body['message']['no_selular'] != null) {
        _showMsg(body['message']['no_selular'][0].toString());
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(new SnackBar(content: Text("Gagal")));
    }

    setState(() {
      _isLoading = false;
    });
  }
}