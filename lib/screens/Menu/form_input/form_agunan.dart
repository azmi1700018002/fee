import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
final TextEditingController _nameCtrl = TextEditingController();

Widget FAgunan() {
  return Scaffold(
    appBar: AppBar(
      title: Text("Edit User"),
    ),
    body: Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Barang Agunan Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Asuransi Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Nilai Agunan Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Bukti Kepemilikan Agunan Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Ijin yang dimiliki Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new TextField(
            maxLines: 3,
            decoration: new InputDecoration(
              hintText: "Deskripsi pemohon :",
              labelText: "Deskripsi pemohon :",
            ),
          ),
        ],
      ),
    ),
  );
}
