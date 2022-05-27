import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Nasabah extends StatefulWidget {
  @override
  _NasabahState createState() => _NasabahState();
}

class _NasabahState extends State<Nasabah> {
  String nama_debitur = '';
  String alamat = '';
  String no_telp = '';
  String no_ktp = '';
  String no_selular = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var mstdebitur = jsonDecode(localStorage.getString('mstdebitur'));

    print(mstdebitur);

    if (mstdebitur != null) {
      setState(() {
        nama_debitur = mstdebitur['nama_debitur'];
        alamat = mstdebitur['alamat'];
        no_telp = mstdebitur['no_telp'];
        no_ktp = mstdebitur['no_ktp'];
        no_selular = mstdebitur['no_selular'];
      });
    }
  }

  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Nama Debitur',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Alamat',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'no_telp',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'no_ktp',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'no_selular',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('nama_debitur')),
                    DataCell(Text('43')),
                    DataCell(Text('Professor')),
                    DataCell(Text('Student')),
                    DataCell(Text('Student')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
