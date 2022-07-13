import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import 'list_pengajuan_debitur.dart';

class ProseInputAnalisaB extends StatefulWidget {
  const ProseInputAnalisaB({Key key}) : super(key: key);

  @override
  _ProseInputAnalisaBState createState() => _ProseInputAnalisaBState();
}

class _ProseInputAnalisaBState extends State<ProseInputAnalisaB> {
  final List<Map<String, dynamic>> _omzet = [
    {
      'value': 'Omzet selalu diatas 80% dari target',
      'label': 'Omzet selalu diatas 80% dari target',
    },
    {
      'value': 'Omzet selalu dibawah 80% dari target',
      'label': 'Omzet selalu dibawah 80% dari target',
    },
  ];
  final List<Map<String, dynamic>> _harga = [
    {
      'value': 'Harga sama dengan pesaing sejenis',
      'label': 'Harga sama dengan pesaing sejenis',
    },
    {
      'value': 'Harga tidak sama dengan pesaing sejenis',
      'label': 'Harga tidak sama dengan pesaing sejenis',
    },
  ];
  final List<Map<String, dynamic>> _persaingan = [
    {
      'value': 'Cukup ketat',
      'label': 'Cukup ketat',
    },
    {
      'value': 'Tidak ketat',
      'label': 'Tidak ketat',
    },
  ];
  final List<Map<String, dynamic>> _lokasi = [
    {
      'value': 'Strategis',
      'label': 'Strategis',
    },
    {
      'value': 'Tidak Strategis',
      'label': 'Tidak Strategis',
    },
  ];
  final List<Map<String, dynamic>> _produktivitas = [
    {
      'value': 'Tercapai terhadap penjualan',
      'label': 'Tercapai terhadap penjualan',
    },
    {
      'value': 'Tidak Tercapai terhadap penjualan',
      'label': 'Tidak Tercapai terhadap penjualan',
    },
  ];
  final List<Map<String, dynamic>> _kwalitas = [
    {
      'value': 'Baik',
      'label': 'Baik',
    },
    {
      'value': 'Kurang Baik',
      'label': 'Kurang Baik',
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
                          title: Text('Form Analisa Bisnis'),
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
                      icon: Icon(Icons.money),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Omzet penjualan',
                    ),
                    initialValue: 'circle',
                    items: _omzet,
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
                      icon: Icon(Icons.attach_money_sharp),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Harga bersaing',
                    ),
                    initialValue: 'circle',
                    items: _harga,
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
                      icon: Icon(Icons.multiline_chart),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Persaingan',
                    ),
                    initialValue: 'circle',
                    items: _persaingan,
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
                      icon: Icon(Icons.location_city),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Lokasi',
                    ),
                    initialValue: 'circle',
                    items: _lokasi,
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
                      icon: Icon(Icons.production_quantity_limits),
                      suffixIcon: Icon(
                          Icons.arrow_drop_down),
                      labelText: 'Produktivitas thp kapasitas terpasang',
                    ),
                    initialValue: 'circle',

                    items: _produktivitas,
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
                      labelText: 'Kwalitas',
                    ),
                    initialValue: 'circle',
                    items: _kwalitas,
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ListPengajuanAnalisaKredit()));
        },
        label: const Text('Simpan'),
        icon: const Icon(Icons.save),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
