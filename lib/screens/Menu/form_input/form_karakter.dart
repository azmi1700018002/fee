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

Widget FKarakter() {
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
            labelText: 'Ulet Dalam Bisnis',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Flexible',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Kreatif/Inovatif',
            items: _ju,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            labelText: 'Memiliki Kejujuran dlm bisnis',
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
