import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/mstdebitur.dart';

import '../../../../network/debitur_service.dart';

class T_VerikasiDebitur extends StatelessWidget {
  final Mstdebitur mstdebitur;
  final MstdebiturApiService api = MstdebiturApiService();


  T_VerikasiDebitur({Key key, @required this.mstdebitur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Verifikasi Data'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Finish"),
                Text("Nama Debitur ${mstdebitur.namaDebitur}"),
                Text("Alamat ${mstdebitur.alamat}"),
                Text("Tempat Lahir ${mstdebitur.tempatLahir}"),
                Text("Tanggal Lahir ${mstdebitur.tanggalLahir}"),
                Text("Pekerjaan ${mstdebitur.pekerjaan}"),
                Text("Instansi ${mstdebitur.instansi}"),
                Text("Agama ${mstdebitur.agama}"),
                Text("Gender ${mstdebitur.gender}"),
                Text("No Telepon ${mstdebitur.noTelp}"),
                Text("No Seluler ${mstdebitur.noSeluler}"),
                Text("Email ${mstdebitur.email}"),
                Text("Nama Ibu ${mstdebitur.namaIbu}"),
                Text("Relationship ${mstdebitur.relationship}"),
                Text("Nama Pasangan ${mstdebitur.namaPasangan}"),
                Text("Pekerjaan Pasangan ${mstdebitur.pekerjaanPasangan}"),
                Text("Tanggal Lahir Pasangan ${mstdebitur.tglLahirPasangan}"),
                Text("Tempat Lahir Pasangan ${mstdebitur.tempatLahirPasangan}"),
                Text("Total Income ${mstdebitur.totalIncome}"),
                Text("Bidang Usaha ${mstdebitur.bidangUsaha}"),
                Text("Provinsi ${mstdebitur.provinsi}"),
                Text("Kabupaten ${mstdebitur.kabupaten}"),
                Text("Kecamatan ${mstdebitur.kecamatan}"),
                Text("Kelurahan ${mstdebitur.kelurahan}"),
                Text("Jumlah Tanggungan ${mstdebitur.jumlahTanggungan}"),
                RaisedButton(
                  child: Text("Simpan"),
                  onPressed: () {
                      api.createNasabah(
                        Mstdebitur(
                          // namaDebitur: mstdebitur.namaDebitur,
                          // alamat: mstdebitur.alamat,
                          // tempatLahir: mstdebitur.tempatLahir,
                          // tanggalLahir: mstdebitur.tanggalLahir,
                          // pekerjaan: mstdebitur.pekerjaan,
                          // instansi: mstdebitur.instansi,
                          // agama: mstdebitur.agama,
                          // gender: mstdebitur.gender,
                          // noTelp: mstdebitur.noTelp,
                          // noSeluler: mstdebitur.email,
                          // namaIbu: mstdebitur.namaIbu,
                          // relationship: mstdebitur.relationship,
                          // namaPasangan: mstdebitur.namaPasangan,
                          // pekerjaanPasangan: mstdebitur.pekerjaanPasangan,
                          // tglLahirPasangan: mstdebitur.tglLahirPasangan,
                          // tempatLahirPasangan: mstdebitur.tempatLahirPasangan,
                          // totalIncome: mstdebitur.totalIncome,
                          // bidangUsaha: mstdebitur.bidangUsaha,
                          // provinsi: mstdebitur.provinsi,
                          // kabupaten: mstdebitur.kabupaten,
                          // kecamatan: mstdebitur.kecamatan,
                          // kelurahan: mstdebitur.kelurahan,
                          // jumlahTanggungan: mstdebitur.jumlahTanggungan,
                        )
                      );
                      Navigator.pop(context);
                    }
                ),
              ],
            )));
  }
}
