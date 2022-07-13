
import 'package:flutter/material.dart';

import '../../../../Models/mstdebitur.dart';
import '../../../../network/debitur_service.dart';
import 'detail_debitur.dart';

class ListDebitur extends StatelessWidget {
  final List<Mstdebitur> mstdebitur;
  ListDebitur({Key key,  this.mstdebitur}) : super(key: key);
  final MstdebiturApiService api = MstdebiturApiService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mstdebitur == null ? 0 : mstdebitur.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              shape: Border(left: BorderSide(color: Colors.green, width: 5)),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          mstdebitur[index].namaDebitur,
                        ),
                        Text(
                          mstdebitur[index].alamat,
                        ),
                        Text(
                          mstdebitur[index].relationship,
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
                                                // onPressed: () async {
                                                //   api.deleteNasabah(mstdebitur[index].nik);
                                                //   Navigator.of(context).pop();
                                                // }
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
                                          DetailDebitur(mstdebitur: mstdebitur[index]),
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

