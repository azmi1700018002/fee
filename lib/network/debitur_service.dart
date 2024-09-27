import 'package:flutter_auth/Models/mstdebitur.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MstdebiturApiService {
  final String apiUrl = 'https://fleetime-sigma.herokuapp.com';

  // Get Nasabah
  Future<List<Mstdebitur>> getNasabah() async {
    final response = await http
        .get(Uri.parse('$apiUrl/debiturs'))
        .timeout(const Duration(seconds: 10), onTimeout: () {
      throw Exception('Timeout');
    });

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Mstdebitur> mstdebitur =
      body.map((dynamic item) => Mstdebitur.fromJson(item)).toList();
      return mstdebitur;
    } else {
      throw Exception('Failed to load mstdebitur list');
    }
  }

  // Get Nasabah by id
  Future<Mstdebitur> getNasabahById(int nik) async {
    final response = await http.get(Uri.parse('$apiUrl/debiturs/$nik'));

    if (response.statusCode == 200) {
      Mstdebitur mstdebitur = Mstdebitur.fromJson(jsonDecode(response.body));
      return mstdebitur;
    } else {
      throw Exception('Failed to load mstdebitur');
    }
  }

  // Create Nasabah
  Future<Mstdebitur> createNasabah(Mstdebitur mstdebitur) async {
    Map data = {
      'id' : mstdebitur.id,
      'no_debitur' : mstdebitur.noDebitur,
      'nik': mstdebitur.nik,
      'nama_debitur': mstdebitur.namaDebitur,
      'alamat': mstdebitur.alamat,
      'tempat_lahir' : mstdebitur.tempatLahir,
      'tanggal_lahir' : mstdebitur.tanggalLahir,
      'pekerjaan' : mstdebitur.pekerjaan,
      'instansi' : mstdebitur.instansi,
      'agama' : mstdebitur.agama,
      'gender' : mstdebitur.gender,
      'no_telp' : mstdebitur.noTelp,
      'no_selular' : mstdebitur.noSeluler,
      'email' : mstdebitur.email,
      'nama_ibu' : mstdebitur.namaIbu,
      'relationship' : mstdebitur.relationship,
      'nama_pasangan' : mstdebitur.namaPasangan,
      'pekerjaan_pasangan' : mstdebitur.pekerjaanPasangan,
      'tgl_lahir_pasangan' : mstdebitur.tglLahirPasangan,
      'tempat_lahir_pasangan' : mstdebitur.tempatLahirPasangan,
      'nik_pasangan' : mstdebitur.nikPasangan,
      'total_income' : mstdebitur.totalIncome,
      'bidang_usaha' : mstdebitur.bidangUsaha,
      'jumlah_tanggungan' : mstdebitur.jumlahTanggungan,
      'provinsi' : mstdebitur.provinsi,
      'kabupaten' : mstdebitur.kabupaten,
      'kecamatan': mstdebitur.kecamatan,
      'kelurahan': mstdebitur.kelurahan,
      'rt' : mstdebitur.rt,
      'rw' :mstdebitur.rw,
      'kodepos': mstdebitur.kodePos,
    };

    final response = await http.post(Uri.parse('$apiUrl/debiturs'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return Mstdebitur.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create nasabah');
    }
  }

  // Edit Nasabah by id
  Future<Mstdebitur> editDebitur(int nik, Mstdebitur mstdebitur) async {
    Map data = {
      'id': mstdebitur.id,
      'no_debitur': mstdebitur.noDebitur,
      'nik': mstdebitur.nik,
      'nama_debitur': mstdebitur.namaDebitur,
      'alamat': mstdebitur.alamat,
      'tempat_lahir': mstdebitur.tempatLahir,
      'tanggal_lahir': mstdebitur.tanggalLahir,
      'pekerjaan': mstdebitur.pekerjaan,
      'instansi': mstdebitur.instansi,
      'agama' : mstdebitur.agama,
      'gender' : mstdebitur.gender,
      'no_telp' : mstdebitur.noTelp,
      'no_selular' : mstdebitur.noSeluler,
      'email' : mstdebitur.email,
      'nama_ibu': mstdebitur.namaIbu,
      'relationship': mstdebitur.relationship,
      'nama_pasangan' :mstdebitur.namaPasangan,
      'perkejaan_pasangan' : mstdebitur.pekerjaanPasangan,
      'tgl_lahir_pasangan' : mstdebitur.tglLahirPasangan,
      'tempat_lahir_pasangan' : mstdebitur.tempatLahirPasangan,
      'nik_pasangan': mstdebitur.nikPasangan,
      'total_income': mstdebitur.totalIncome,
      'bidang_usaha': mstdebitur.bidangUsaha,
      'jumlah_tanggungan': mstdebitur.jumlahTanggungan,
      'provinsi' : mstdebitur.provinsi,
      'kabupaten' : mstdebitur.kabupaten,
      'kecamatan': mstdebitur.kecamatan,
      'kelurahan': mstdebitur.kelurahan,
      'rt' : mstdebitur.rt,
      'rw' :mstdebitur.rw,
      'kodepos': mstdebitur.kodePos,
    };

    final response = await http.put(Uri.parse('$apiUrl/debiturs/$nik'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return Mstdebitur.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to edit nasabah');
    }
  }

  // Future<bool> updateNasabah(int nik, Mstdebitur data) async {
  //   final response = await http.put(Uri.parse('$apiUrl/mstdebitur/${nik}'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: mstdebiturToJson(data));
  //
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Exception('Failed to update nasabah');
  //   }
  // }

  // Delete Nasabah
  Future<void> deleteNasabah(int nik) async {
    final response = await http.delete(Uri.parse('$apiUrl/debiturs/$nik'));

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete nasabah');
    }
  }
}
