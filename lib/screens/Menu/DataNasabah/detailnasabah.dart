import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/nasabah.dart';
import 'package:flutter_auth/screens/Menu/edit_nasabah.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DetailNasabah extends StatefulWidget {
  Nasabah nasabah;
  DetailNasabah({this.nasabah});
  @override
  _DetailNasabahState createState() => _DetailNasabahState(this.nasabah);
}

class _DetailNasabahState extends State<DetailNasabah> {
  final Nasabah nasabah;
  _DetailNasabahState(this.nasabah);
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
  }

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Detail Nasabah'),
        backgroundColor: Color(0xff151515),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
        DataTable(columns: [
          DataColumn(label: Text('Aksi')),
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Alamat')),
          DataColumn(label: Text('No Telp')),
          DataColumn(label: Text('No KTP')),
          DataColumn(label: Text('No Seluler')),
        ], rows: [
          DataRow(cells: [
            DataCell(
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNasabah(nasabah: nasabah),
                      ),
                    );
                  },
                )),
            DataCell(Text(nasabah.id.toString())),
            DataCell(Text(nasabah.nama_debitur.toString())),
            DataCell(Text(nasabah.alamat.toString())),
            DataCell(Text(nasabah.no_telp.toString())),
            DataCell(Text(nasabah.no_ktp.toString())),
            DataCell(Text(nasabah.no_selular.toString())),
          ]),
        ]),
        // ],
        // ),
        // )),
      ),
    );
  }
}
