
import 'package:flutter/material.dart';

import '../../../Models/nasabah.dart';
import '../../../network/nasabah_service.dart';
import 'detail_debitur.dart';

class ListDebitur extends StatelessWidget {
  final List<Nasabah> nasabah;
  ListDebitur({Key key,  this.nasabah}) : super(key: key);
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: nasabah == null ? 0 : nasabah.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              shape: Border(left: BorderSide(color: Colors.green, width: 5)),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nasabah[index].nama_debitur,
                        ),
                        Text(
                          nasabah[index].alamat,
                        ),
                        Text(
                          nasabah[index].no_ktp,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          title: Text('Hapus Data Nasabah'),
                                          content: Text(
                                              'Apakah anda yakin ingin menghapus data nasabah ini?'),
                                          actions: [
                                            TextButton(
                                                child: Text('hapus'),
                                                onPressed: () async {
                                                  api.deleteNasabah(nasabah[index].id);
                                                  Navigator.of(context).pop();
                                                }
                                            ),
                                            TextButton(
                                                child: Text('tidak'),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                }
                                            )
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
                                          DetailDebitur(nasabah: nasabah[index]),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.navigate_next),
                                label: Text(
                                  'Detail',
                                ),
                              )
                            ]),
                      ])));
        });
  }
}

