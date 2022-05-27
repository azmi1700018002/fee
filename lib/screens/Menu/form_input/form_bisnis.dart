import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';


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

Widget FBisnis(){
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
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Omzet Penjualan',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Harga bersaing',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Persaingan',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Lokasi',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Produktivitas thp kapasitas terpasan',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Kwalitas',
            items: _ju,
            onChanged: (val) => print(val),
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
