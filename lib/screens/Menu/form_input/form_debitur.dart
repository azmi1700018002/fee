import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';


final _formKey = GlobalKey<FormState>();
final TextEditingController _nameCtrl = TextEditingController();
final List<Map<String, dynamic>> _pd = [
  {
    'value': 'boxValue',
    'label': 'SD',
  },
  {
    'value': 'circleValue',
    'label': 'SMP',
  },
];
final List<Map<String, dynamic>> _ju = [
  {
    'value': 'boxValue',
    'label': 'Pedagang',
  },
];

Widget FDebitur(){
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
                return 'Peminjam 1 Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Alamat 1 Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Lamanya berusaha (tahun) Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Tempat Lahir Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          DateTimePicker(
            initialValue: '',
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            dateLabelText: 'Tanggal Lahir',
            onChanged: (val) => print(val),
            validator: (val) {
              print(val);
              return null;
            },
            onSaved: (val) => print(val),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Pendidikan',
            items: _pd,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Jenius Usaha',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'SKPK No Harus Di Isi';
              }
              return null;
            },
            controller: _nameCtrl,
          ),
          DateTimePicker(
            initialValue: '',
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            dateLabelText: 'Tanggal ',
            onChanged: (val) => print(val),
            validator: (val) {
              print(val);
              return null;
            },
            onSaved: (val) => print(val),
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
