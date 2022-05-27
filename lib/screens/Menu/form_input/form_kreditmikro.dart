import 'package:cool_stepper/cool_stepper.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
final TextEditingController _nameCtrl = TextEditingController();

Widget FKreditMikro(){
  CoolStep(
    title: 'Data & Analisa Kredit Mikro',
    subtitle: 'Isi Form Kredit Mikro',
    content: Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Kredit yang diusulkan Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Provisi (%) Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Digunakan untuk Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Pinjaman lainnya Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Nilai Asset Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Penjualan/bln yll Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'HPP dan bagi hasil/bln Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Biaya Tenaga Kerja Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Biaya Kebersihan Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Biaya Hidup Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Bunga/thn (%) Harus Di Isi';
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
    validation: () {
      return null;
    },
  );
}
