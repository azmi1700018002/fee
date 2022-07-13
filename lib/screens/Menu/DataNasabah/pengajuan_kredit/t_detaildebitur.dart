import 'dart:ffi';

import 'package:date_field/date_field.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/pengajuan_kredit/save_all_mstdebitur.dart';
import 'package:intl/intl.dart';

import '../../../../Models/mstdebitur.dart';

class T_DetailDebitur extends StatelessWidget {
  final Mstdebitur mstdebitur;
  T_DetailDebitur({Key key, @required this.mstdebitur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _tempatlahirController = new TextEditingController();
    TextEditingController _tanggallahirController = new TextEditingController();
    TextEditingController _pekerjaanController = new TextEditingController();
    TextEditingController _totalincomeController = new TextEditingController();
    TextEditingController _bidangusahaController = new TextEditingController();
    TextEditingController _instansiController = new TextEditingController();
    TextEditingController _agamaController = new TextEditingController();
    TextEditingController _jeniskelaminController = new TextEditingController();
    TextEditingController _statusperkawinanController =
        new TextEditingController();
    TextEditingController _namapasanganController = new TextEditingController();
    TextEditingController _pekerjaanpasanganController =
        new TextEditingController();
    TextEditingController _tempatlahirpasanganController =
        new TextEditingController();
    TextEditingController _tanggallahirpasanganController =
        new TextEditingController();
    TextEditingController _nikpasanganController = new TextEditingController();
    TextEditingController _namaibukandungController =
        new TextEditingController();
    TextEditingController _jumlahtanggunganController =
        new TextEditingController();

    _tempatlahirController.text = mstdebitur.tempatLahir;
    _tanggallahirController.text = mstdebitur.tanggalLahir as String;
    _pekerjaanController.text = mstdebitur.pekerjaan;
    _totalincomeController.text = mstdebitur.totalIncome;
    _bidangusahaController.text = mstdebitur.bidangUsaha;
    _instansiController.text = mstdebitur.instansi;
    _agamaController.text = mstdebitur.agama;
    _jeniskelaminController.text = mstdebitur.gender;
    _statusperkawinanController.text = mstdebitur.relationship;
    _namapasanganController.text = mstdebitur.namaPasangan;
    _pekerjaanpasanganController.text = mstdebitur.pekerjaanPasangan;
    _tempatlahirpasanganController.text = mstdebitur.tempatLahirPasangan;
    _tanggallahirpasanganController.text = mstdebitur.tglLahirPasangan;
    _nikpasanganController.text = mstdebitur.nikPasangan;
    _namaibukandungController.text = mstdebitur.namaIbu;
    _jumlahtanggunganController.text = mstdebitur.jumlahTanggungan;

    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Debitur'),
        ),
        body: Form(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading:
                              Icon(Icons.info, color: Colors.black, size: 50),
                          title: Text('Form Detail Debitur'),
                          subtitle:
                              Text("Silahkan isi sesuai form dibawah ini"),
                        ),
                      ],
                    ),
                    color: Colors.green.shade200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'NIK',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tempatlahirController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Tempat Lahir',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tanggallahirController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _pekerjaanController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Pekerjaan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _totalincomeController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jumlah Penghasilan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _bidangusahaController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Bidang Usaha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _instansiController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Instansi',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _agamaController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Agama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _jeniskelaminController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jenis Kelamin',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _statusperkawinanController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Status Perkawinan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _namapasanganController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nama Pasangan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _pekerjaanpasanganController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Pekerjaan Pasangan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tempatlahirpasanganController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Tempat Lahir Pasangan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tanggallahirController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir Pasangan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tanggallahirpasanganController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir Pasangan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nikpasanganController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'NIK Pasangan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _namaibukandungController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nama Ibu Kandung',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _jumlahtanggunganController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jumlah Tanggungan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Continue"),
                    onPressed: () {
                      mstdebitur.tempatLahir = _tempatlahirController.text;
                      // mstdebitur.tanggalLahir = DateTimePickerType.dateTime
                      mstdebitur.pekerjaan = _pekerjaanController.text;
                      mstdebitur.totalIncome = _totalincomeController.text;
                      mstdebitur.bidangUsaha = _bidangusahaController.text;
                      mstdebitur.instansi = _instansiController.text;
                      mstdebitur.agama = _agamaController.text;
                      mstdebitur.gender = _jeniskelaminController.text;
                      mstdebitur.relationship =
                          _statusperkawinanController.text;
                      mstdebitur.namaPasangan = _namapasanganController.text;
                      mstdebitur.pekerjaanPasangan =
                          _pekerjaanpasanganController.text;
                      mstdebitur.tempatLahirPasangan =
                          _tempatlahirpasanganController.text;
                      mstdebitur.tglLahirPasangan =
                          _tanggallahirpasanganController.text;
                      mstdebitur.nikPasangan = _nikpasanganController.text;
                      mstdebitur.namaIbu = _namaibukandungController.text;
                      mstdebitur.jumlahTanggungan =
                          _jumlahtanggunganController.text;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                T_VerikasiDebitur(mstdebitur: mstdebitur)),
                      );
                    },
                  ),
                ],
              ))
        ]))));
  }
}
