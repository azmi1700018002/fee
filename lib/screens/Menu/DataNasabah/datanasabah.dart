import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/nasabah.dart';
import 'package:flutter_auth/network/nasabah_service.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/detailnasabah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DataNasabah extends StatefulWidget {
  @override
  _DataNasabahState createState() => _DataNasabahState();
}

class _DataNasabahState extends State<DataNasabah> {
  String nama_debitur = '';
  List<Nasabah> _nasabah = [];


  @override
  void initState() {
    super.initState();
    _loadUserData();
    _getNasabah();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        nama_debitur = user['nama_debitur'];
      });
    }
  }

  _getNasabah() {
    NasabahService.getUser().then((nasabah) {
      if (mounted) {
        setState(() {
          _nasabah = nasabah;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Data Nasabah'),
        backgroundColor: Color(0xff151515),
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          rowsPerPage: 10,
          columns: [
            DataColumn(
              label: Expanded(
                  child: Text(
                'ID Nasabah',
                textAlign: TextAlign.center,
              )),
            ),
            DataColumn(
              label: Expanded(
                  child: Text(
                'Nama Nasabah',
                textAlign: TextAlign.center,
              )),
            ),
            DataColumn(
              label: Expanded(
                  child: Text(
                'Aksi',
                textAlign: TextAlign.center,
              )),
            ),
          ],
          source: NasabahDataTableSource(
            userData: _nasabah,
            context: context,
            onUserDeleted:(){
              _getNasabah();
            }
          ),
        ),
      ),
    );
  }
}

class NasabahDataTableSource extends DataTableSource {
  BuildContext context;
  Function onUserDeleted;
  NasabahDataTableSource({this.context, this.userData, this.onUserDeleted});
  final List<Nasabah> userData;

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Align(
            alignment: Alignment.center,
            child: Text(
              "${userData[index].id}",
            ))),
        DataCell(Align(
          alignment: Alignment.center,
          child: Text("${userData[index].nama_debitur}"),
        )),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.navigate_next),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailNasabah(
                            nasabah: userData[index],
                          ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(
                          title: Text('Hapus Data Nasabah'),
                          content: Text(
                              'Apakah anda yakin ingin menghapus data nasabah ini?'),
                          actions: [
                            TextButton(
                                child: Text('Yes'),
                                onPressed: () async {
                                  NasabahService.deleteUser(userData[index].id);
                                  Navigator.of(context).pop();
                                  onUserDeleted();
                                })
                          ],
                        ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => userData.length;

  @override
  int get selectedRowCount => 0;

  void sort<T>(Comparable<T> getField(Nasabah d), bool ascending) {
    userData.sort((Nasabah a, Nasabah b) {
      if (!ascending) {
        final Nasabah c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}