
import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import '../../../../Models/mstdebitur.dart';
import '../../../../network/debitur_service.dart';
import '../edit_debitur.dart';


class DetailDebitur extends StatefulWidget {
  final Mstdebitur mstdebitur;
  DetailDebitur({Key key, this.mstdebitur}) : super(key: key);

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

  final MstdebiturApiService api = MstdebiturApiService();

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
                'Master Debitur',
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
                    child: Text('Nama Lengkap :', style: _textHeadStyle),
                  ),
                  Text(
                    widget.mstdebitur.namaDebitur.toString(),
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
                    widget.mstdebitur.alamat.toString(),
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
                      'Provinsi :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.provinsi.toString(),
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
                      'Kabupaten :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.kabupaten.toString(),
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
                      'Kecamatan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.kecamatan.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kelurahan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.kelurahan.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'RW :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.rw.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'RT :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.rt.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kode POS :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.kodePos.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'No Telpon :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.noTelp.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'No Seluler :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.noSeluler.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.email.toString(),
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
                'Detail Master Debitur',
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
                    child: Text(
                      'NIK :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.nik.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tempat Lahir :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.tempatLahir.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tanggal Lahir :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.tanggalLahir.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pekerjaan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.pekerjaan,
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Jumlah Penghasilan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.totalIncome.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bidang Usaha :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.bidangUsaha.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Instansi :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.instansi.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Agama :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.agama.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Jenis Kelamin :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.gender.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Status Perkawinan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.relationship.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nama Pasangan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.namaPasangan.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pekerjaan Pasangan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.pekerjaanPasangan.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tempat Lahir Pasangan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.tempatLahirPasangan.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tanggal Lahir Pasangan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.tglLahirPasangan.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'NIK Pasangan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.nikPasangan.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nama Ibu Kandung :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.namaIbu.toString(),
                    style: _textContenStyle,
                  ),
                ]),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Jumlah Tanggungan :',
                      style: _textHeadStyle,
                    ),
                  ),
                  Text(
                    widget.mstdebitur.jumlahTanggungan.toString(),
                    style: _textContenStyle,
                  ),
                ]),
              ]),
            ),
          ]
      )
    );
  }

  _navigateToEditNasabah(BuildContext context) async {
    // final result = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => EditDebitur(widget.mstdebitur),
    //   ),
    // );
  }
}
