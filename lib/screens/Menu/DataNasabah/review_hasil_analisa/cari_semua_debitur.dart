import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/review_hasil_analisa/detail_debitur.dart';
import 'package:search_page/search_page.dart';
import '../../../../Models/mstdebitur.dart';
import '../../../../network/debitur_service.dart';
import 'list_debitur.dart';

class CariDebitur extends StatefulWidget {
  const CariDebitur({
    Key key,
  }) : super(key: key);

  @override
  State<CariDebitur> createState() => _CariDebiturState();
}

class _CariDebiturState extends State<CariDebitur> {
  final MstdebiturApiService api = MstdebiturApiService();
  List<Mstdebitur> nasabahList;

  Widget build(BuildContext context) {
    // ignore: prefer_conditional_assignment, unnecessary_null_comparison
    if (nasabahList == null) {
      // ignore: deprecated_member_use, prefer_collection_literals
      nasabahList = <Mstdebitur>[];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Review Semua Data Debitur'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return nasabahList.length > 0
                  ? ListDebitur(mstdebitur: nasabahList)
                  : Text('No Data');
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Search people',
          onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Mstdebitur>(
                    onQueryUpdate: (s) => print(s),
                    items: nasabahList,
                    searchLabel: 'Cari Nasabah',
                    suggestion: Center(
                      child: Text('Pencarian berdasarkan nama,alamat,ktp'),
                    ),
                    failure: Center(
                      child: Text('Data tidak ditemukan'),
                    ),
                    filter: (nasabah) => [
                          nasabah.namaDebitur,
                          nasabah.alamat,
                          nasabah.relationship.toString(),
                        ],
                    builder: (nasabah) => Card(
                        shape: Border(
                            left: BorderSide(color: Colors.green, width: 5)),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(nasabah.namaDebitur),
                                    subtitle: Text(nasabah.alamat),
                                    trailing: Text('${nasabah.relationship}'),
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                        title: Text(
                                                            'Hapus Data Nasabah'),
                                                        content: Text(
                                                            'Apakah anda yakin ingin menghapus data nasabah ini?'),
                                                        actions: [
                                                          TextButton(
                                                              child:
                                                                  Text('hapus'),
                                                              onPressed:
                                                                  () async {
                                                                // Navigator.of(context).pop();
                                                                // api.deleteNasabah(
                                                                //     nasabah.nik);
                                                                // Navigator.of(context).pop();
                                                              }),
                                                          TextButton(
                                                              child:
                                                                  Text('tidak'),
                                                              onPressed:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              })
                                                        ]));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                          ),
                                          icon: Icon(Icons.delete),
                                          label: Text('Hapus'),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailDebitur(
                                                        mstdebitur: nasabah),
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.navigate_next),
                                          label: Text(
                                            'Detail',
                                          ),
                                        )
                                      ]),
                                ])))),
              ),
          child: Icon(Icons.search),
          backgroundColor: Colors.orange),
    );
  }

  Future loadList() {
    Future<List<Mstdebitur>> futureNasabah = api.getNasabah();
    futureNasabah.then((nasabahList) {
      if (mounted) {
        setState(() {
          this.nasabahList = nasabahList;
        });
      }
    });
    return futureNasabah;
  }
}
