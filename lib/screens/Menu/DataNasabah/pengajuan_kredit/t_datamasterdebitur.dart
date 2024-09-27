import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/pengajuan_kredit/t_detaildebitur.dart';
import '../../../../Models/mstdebitur.dart';
import '../../../../network/debitur_service.dart';

class T_DataMasterDebitur extends StatelessWidget {
  final MstdebiturApiService api = MstdebiturApiService();
  final Mstdebitur mstdebitur;
  final _addFormKey = GlobalKey<FormState>();
  T_DataMasterDebitur({Key key, @required this.mstdebitur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _namadebiturController = new TextEditingController();
    TextEditingController _alamatController = new TextEditingController();
    TextEditingController _provinsiController = new TextEditingController();
    TextEditingController _kabupatenController = new TextEditingController();
    TextEditingController _kecamatanController = new TextEditingController();
    TextEditingController _kelurahanController = new TextEditingController();
    TextEditingController _rwController = new TextEditingController();
    TextEditingController _rtController = new TextEditingController();
    TextEditingController _kodeposController = new TextEditingController();
    TextEditingController _notelpController = new TextEditingController();
    TextEditingController _noselularController = new TextEditingController();
    TextEditingController _emailController = new TextEditingController();

    _namadebiturController.text = mstdebitur.namaDebitur;
    _alamatController.text = mstdebitur.alamat;
    _provinsiController.text = mstdebitur.provinsi;
    _kabupatenController.text = mstdebitur.kabupaten;
    _kecamatanController.text = mstdebitur.kecamatan;
    _kelurahanController.text = mstdebitur.kelurahan;
    _rwController.text = mstdebitur.rw;
    _rtController.text = mstdebitur.rt;
    _kodeposController.text = mstdebitur.kodePos;
    _notelpController.text = mstdebitur.noTelp;
    _noselularController.text = mstdebitur.noSeluler;
    _emailController.text = mstdebitur.email;

    return Scaffold(
        appBar: AppBar(
          title: Text('Data Master Debitur'),
        ),
        body: Form(
            key: _addFormKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.info, color: Colors.black ,size: 50),
                              title: Text('Form Master Debitur'),
                              subtitle:
                                  Text("Silahkan isi sesuai form dibawah ini"),
                            ),
                          ],
                        ),
                        color: Colors.orange.shade200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _namadebiturController,
                        decoration: InputDecoration(
                          labelText: 'Nama Debitur',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _alamatController,
                        decoration: InputDecoration(
                          labelText: 'Alamat',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _provinsiController,
                        decoration: InputDecoration(
                          labelText: 'Provinsi',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _kabupatenController,
                        decoration: InputDecoration(
                          labelText: 'Kabupaten',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _kecamatanController,
                        decoration: InputDecoration(
                          labelText: 'Kecamatan',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _kelurahanController,
                        decoration: InputDecoration(
                          labelText: 'Kelurahan',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _rtController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'RT',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _rwController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'RW',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _kodeposController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Kode POS',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _notelpController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'No Telepon',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _noselularController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'No Seluler',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        child: Text("Next"),
                        // onPressed: () {
                        //   if (_addFormKey.currentState.validate()) {
                        //     _addFormKey.currentState?.save();
                        //     api.createNasabah(
                        //       Mstdebitur(
                        //         namaDebitur: _namadebiturController.text,
                        //         alamat: _alamatController.text,
                        //         provinsi: _provinsiController.text,
                        //         kabupaten: _kabupatenController.text,
                        //         kecamatan: _kecamatanController.text,
                        //         kelurahan: _kelurahanController.text,
                        //         rt: _rtController.text,
                        //         rw: _rwController.text,
                        //         kodePos: _kodeposController.text,
                        //         noTelp: _notelpController.text,
                        //         noSeluler: _noselularController.text,
                        //         email: _emailController.text,
                        //       ),
                        //     );
                        //     Navigator.pop(context);
                        //   }
                        // },
                        onPressed: () {
                          mstdebitur.namaDebitur = _namadebiturController.text;
                          mstdebitur.alamat = _alamatController.text;
                          mstdebitur.provinsi = _provinsiController.text;
                          mstdebitur.kabupaten = _kabupatenController.text;
                          mstdebitur.kecamatan = _kecamatanController.text;
                          mstdebitur.kelurahan = _kelurahanController.text;
                          mstdebitur.rt = _rtController.text;
                          mstdebitur.rw = _rwController.text;
                          mstdebitur.kodePos = _kodeposController.text;
                          mstdebitur.noTelp = _notelpController.text;
                          mstdebitur.noSeluler = _noselularController.text;
                          mstdebitur.email = _emailController.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    T_DetailDebitur(mstdebitur: mstdebitur)),
                          );
                        },
                      ),
                    ],
                  ))
            ]))));
  }
}
