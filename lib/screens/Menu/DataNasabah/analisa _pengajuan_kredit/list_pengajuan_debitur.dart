import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/analisa%20_pengajuan_kredit/proses_input_analisaK.dart';

class ListPengajuanAnalisaKredit extends StatefulWidget {
  const ListPengajuanAnalisaKredit({Key key}) : super(key: key);

  @override
  _ListPengajuanAnalisaKreditState createState() => _ListPengajuanAnalisaKreditState();
}

class _ListPengajuanAnalisaKreditState extends State<ListPengajuanAnalisaKredit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("List Pengajuan Debitur"),
      ),
        body: Container(
            child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProseInputAnalisaK()))
                    },
                    child: Card(
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [

                            Expanded(
                              flex: 8,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("No Pengajuan : 1700018025"),
                                    Text("Farida Kurnia"),
                                    Text("Boyolali")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}
