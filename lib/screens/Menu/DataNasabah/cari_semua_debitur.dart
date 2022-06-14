import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/detail_debitur.dart';
import 'package:search_page/search_page.dart';
import '../../../Models/nasabah.dart';
import '../../../network/nasabah_service.dart';
import 'list_debitur.dart';

class CariDebitur extends StatefulWidget {
  const CariDebitur({
    Key key,
  }) : super(key: key);

  @override
  State<CariDebitur> createState() => _CariDebiturState();
}

class _CariDebiturState extends State<CariDebitur> {
  final ApiService api = ApiService();
  List<Nasabah> nasabahList = [];

  Widget build(BuildContext context) {
    // ignore: prefer_conditional_assignment, unnecessary_null_comparison
    if (nasabahList == null) {
      // ignore: deprecated_member_use, prefer_collection_literals
      nasabahList = <Nasabah>[];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Nasabah'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return nasabahList.length > 0
                  ? ListDebitur(nasabah: nasabahList)
                  : Text('No Data');
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Search people',
          onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Nasabah>(
                    onQueryUpdate: (s) => print(s),
                    items: nasabahList,
                    searchLabel: 'Search people',
                    suggestion: Center(
                      child: Text('Filter people by name, surname or age'),
                    ),
                    failure: Center(
                      child: Text('No person found :('),
                    ),
                    filter: (nasabah) => [
                          nasabah.nama_debitur,
                          nasabah.alamat,
                          nasabah.no_ktp.toString(),
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
                                    title: Text(nasabah.nama_debitur),
                                    subtitle: Text(nasabah.alamat),
                                    trailing: Text('${nasabah.no_ktp}'),
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
                                                                Navigator.of(context).pop();
                                                                api.deleteNasabah(
                                                                    nasabah.id);
                                                                Navigator.of(context).pop();
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
                                                        nasabah: nasabah),
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
    Future<List<Nasabah>> futureNasabah = api.getNasabah();
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
