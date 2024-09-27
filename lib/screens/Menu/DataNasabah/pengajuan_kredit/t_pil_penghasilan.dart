import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/pengajuan_kredit/t_penghasilantetap.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/pengajuan_kredit/t_penghasilantdktetap.dart';

class T_Penghasilan extends StatefulWidget {
  const T_Penghasilan({Key key}) : super(key: key);

  @override
  _T_PenghasilanState createState() => _T_PenghasilanState();
}

class _T_PenghasilanState extends State<T_Penghasilan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Penghasilan"),
        ),
        body: Container(
            child: Column(children: [
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => T_PenghasilanTetap()))
            },
            child: Card(
              margin: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Colors.green,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Icon(Icons.attach_money)),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Penghasilan Tetap"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => T_PenghasilanTidakTetap()))
            },
            child: Card(
              margin: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              color: Colors.redAccent,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Icon(Icons.money_off)),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Penghasilan Tidak Tetap"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}
