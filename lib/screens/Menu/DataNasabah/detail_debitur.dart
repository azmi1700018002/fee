
import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import '../../../Models/nasabah.dart';
import '../../../network/nasabah_service.dart';
import 'edit_debitur.dart';


class DetailDebitur extends StatefulWidget {
  final Nasabah nasabah;
  DetailDebitur({Key key, this.nasabah}) : super(key: key);

  @override
  _DetailDebiturState createState() => _DetailDebiturState();
}

class _DetailDebiturState extends State<DetailDebitur> {
  _DetailDebiturState();
  final _textHeadStyle =
  TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  final _textContenStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Nasabah'),
      ),
      body: Accordion(
          maxOpenSections: 4,
          headerBorderRadius: 20,
          contentBorderColor: Colors.grey,
          headerBackgroundColorOpened: Colors.green,
          headerBackgroundColor: Color(0xFFF9A825),
          headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          children: [
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
              header: Text(
                'Data Debitur',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              content: Column(children: [
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Nama Debitur :', style: _textHeadStyle),
                  ),
                  Text(
                    widget.nasabah.nama_debitur.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                SizedBox(
                  height: 3,
                ),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Alamat :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.nasabah.alamat.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                SizedBox(
                  height: 3,
                ),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'no telp :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.nasabah.no_telp.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                SizedBox(
                  height: 3,
                ),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'no ktp :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.nasabah.no_ktp.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                SizedBox(
                  height: 3,
                ),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'no seluler :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.nasabah.no_selular.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      _navigateToEditNasabah(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    icon: Icon(Icons.edit),
                    label: Text(
                      'Edit',
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ]),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
              header: Text(
                'Data Kredit Mikro',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              content: Column(children: [
                Text(widget.nasabah.nama_debitur.toString()),
                Text(widget.nasabah.alamat.toString()),
                Text(widget.nasabah.no_telp.toString()),
                Text(widget.nasabah.no_ktp.toString()),
                Text(widget.nasabah.no_selular.toString()),
              ]),
            )
          ]
      )
    );
  }

  _navigateToEditNasabah(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDebitur(widget.nasabah),
      ),
    );
  }
}
