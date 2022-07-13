import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/analisa%20_pengajuan_kredit/proses_input_analisaB.dart';
import 'package:select_form_field/select_form_field.dart';

class ProseInputAnalisaK extends StatefulWidget {
  const ProseInputAnalisaK({Key key}) : super(key: key);

  @override
  _ProseInputAnalisaKState createState() => _ProseInputAnalisaKState();
}

class _ProseInputAnalisaKState extends State<ProseInputAnalisaK> {
  final List<Map<String, dynamic>> _ulet = [
    {
      'value': 'Cukup ulet',
      'label': 'Cukup ulet',
    },
    {
      'value': 'Tidak ulet',
      'label': 'Tidak ulet',
    },
  ];
  final List<Map<String, dynamic>> _flexible = [
    {
      'value': 'Cukup flexible',
      'label': 'Cukup flexible',
    },
    {
      'value': 'Tidak flexible',
      'label': 'Tidak flexible',
    },
  ];
  final List<Map<String, dynamic>> _kreativ = [
    {
      'value': 'Cukup kreatif',
      'label': 'Cukup kreatif',
    },
    {
      'value': 'Tidak kreatif',
      'label': 'Tidak kreatif',
    },
  ];
  final List<Map<String, dynamic>> _jujur = [
    {
      'value': 'Cukup jujur',
      'label': 'Cukup jujur',
    },
    {
      'value': 'Tidak jujur',
      'label': 'Tidak jujur',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proses Input Agunan"),
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
                          leading: Icon(Icons.info, size: 50),
                          title: Text('Form Analisa Karakter'),
                          subtitle:
                              Text("Silahkan isi sesuai form dibawah ini"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.insert_chart_outlined),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Ulet dalam bisnis',
                    ),
                    initialValue: 'circle',
                    items: _ulet,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.insert_chart_outlined),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Flexible',
                    ),
                    initialValue: 'circle',
                    items: _flexible,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.insert_chart_outlined),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Kreatif/Inovative',
                    ),
                    initialValue: 'circle',
                    items: _kreativ,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.insert_chart_outlined),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Memiliki kejujuran dlm bisnis',
                    ),
                    initialValue: 'circle',
                    items: _jujur,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProseInputAnalisaB()));
        },
        label: const Text('Simpan'),
        icon: const Icon(Icons.save),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
