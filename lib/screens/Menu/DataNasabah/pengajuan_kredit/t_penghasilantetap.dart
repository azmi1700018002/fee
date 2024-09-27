import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/pengajuan_kredit/t_detaildebitur.dart';
import '../../../../Models/mstdebitur.dart';

class T_PenghasilanTetap extends StatelessWidget {
  // final Nasabah nasabah;
  T_PenghasilanTetap({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _namadebiturController = new TextEditingController();
    TextEditingController _alamatController = new TextEditingController();
    TextEditingController _tempatlahirController = new TextEditingController();
    TextEditingController _tanggallahirController = new TextEditingController();
    TextEditingController _pekerjaanController = new TextEditingController();
    TextEditingController _instansiController = new TextEditingController();
    TextEditingController _agamaController = new TextEditingController();
    TextEditingController _genderController = new TextEditingController();
    TextEditingController _notelpController = new TextEditingController();
    TextEditingController _noselularController = new TextEditingController();
    TextEditingController _emailController = new TextEditingController();

    // _namadebiturController.text = nasabah.nama_debitur;
    // _alamatController.text = nasabah.alamat;
    // _tempatlahirController.text = nasabah.tempat_lahir;
    // _tanggallahirController.text = nasabah.tanggal_lahir;
    // _pekerjaanController.text = nasabah.pekerjaan;
    // _instansiController.text = nasabah.instansi;
    // _agamaController.text = nasabah.agama;
    // _genderController.text = nasabah.gender;
    // _notelpController.text = nasabah.no_telp;
    // _noselularController.text = nasabah.no_selular;
    // _emailController.text = nasabah.email;

    return Scaffold(
        appBar: AppBar(
          title: Text('Penghasilan Tetap'),
        ),
        body: Form(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.info, size: 50),
                          title: Text('Form Penghasilan Tetap'),
                          subtitle:
                          Text("Silahkan isi sesuai form dibawah ini"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _namadebiturController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'No Debitur',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _namadebiturController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nama Debitur',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Data Fasilitas
                  Text(
                    'Data Fasilitas ( Informasi data fasilitas yang diajukan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _alamatController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jenis Pengajuan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tempatlahirController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Plafon fasilitas',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tanggallahirController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jenis Penggunaan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _pekerjaanController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Tujuan Penggunaan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _instansiController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jangka Waktu',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Data Penghasilan
                  Text(
                    'Data Penghasilan ( Memuat data informasi penghasilan tetap calon debitur)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _agamaController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Penghasilan Pemohon',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _genderController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Sisa Penghasilan Pemohon',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _notelpController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nama Pejabat penanggung kredit',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _noselularController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jabatan Penanggung Kredit',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nama Pejabat Pemotong Gaji',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jabatan Pemotong Gaji',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Riwayat data kredit terakhir
                  Text(
                    'Riwayat data kredit terakhir ( riwayat data kredit terakhir di PT Bank BPD DIY jika ada)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'No Rekening',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Plafon Kredit',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Mulai',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Jangka Waktu',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Continue"),
                    onPressed: () {
                      // nasabah.nama_debitur = _namadebiturController.text;
                      // nasabah.alamat = _alamatController.text;
                      // nasabah.tempat_lahir = _tempatlahirController.text;
                      // nasabah.tanggal_lahir = _tanggallahirController.text;
                      // nasabah.pekerjaan = _pekerjaanController.text;
                      // nasabah.instansi = _instansiController.text;
                      // nasabah.agama = _agamaController.text;
                      // nasabah.gender = _genderController.text;
                      // nasabah.no_telp = _notelpController.text;
                      // nasabah.no_selular = _noselularController.text;
                      // nasabah.email = _emailController.text;
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => T_OrangTua(nasabah: nasabah)),
                      // );
                    },
                  ),
                ],
              ))
        ]))));
  }
}
