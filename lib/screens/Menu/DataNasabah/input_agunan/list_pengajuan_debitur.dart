import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/analisa%20_pengajuan_kredit/proses_input_analisaK.dart';

class ListPengajuanInputAgunan extends StatefulWidget {
  const ListPengajuanInputAgunan({Key key}) : super(key: key);

  @override
  _ListPengajuanInputAgunanState createState() => _ListPengajuanInputAgunanState();
}

class _ListPengajuanInputAgunanState extends State<ListPengajuanInputAgunan> {
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
