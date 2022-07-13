import 'dart:convert';

List<Mstdebitur> mstdebiturFromJson(String str) => List<Mstdebitur>.from(json.decode(str).map((x) => Mstdebitur.fromJson(x)));

String mstdebiturToJson(List<Mstdebitur> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mstdebitur {
  Mstdebitur({
    this.id,
    this.noDebitur,
    this.nik,
    this.namaDebitur,
    this.alamat,
    this.tempatLahir,
    this.tanggalLahir,
    this.pekerjaan,
    this.instansi,
    this.agama,
    this.gender,
    this.noTelp,
    this.noSeluler,
    this.email,
    this.namaIbu,
    this.relationship,
    this.namaPasangan,
    this.pekerjaanPasangan,
    this.tglLahirPasangan,
    this.tempatLahirPasangan,
    this.nikPasangan,
    this.totalIncome,
    this.bidangUsaha,
    this.jumlahTanggungan,
    this.provinsi,
    this.kabupaten,
    this.kecamatan,
    this.kelurahan,
    this.rt,
    this.rw,
    this.kodePos,
    this.nonfixed,
    this.fixed,
  });

  int id;
  String noDebitur;
  String nik;
  String namaDebitur;
  String alamat;
  String tempatLahir;
  DateTime tanggalLahir;
  String pekerjaan;
  String instansi;
  String agama;
  String gender;
  String noTelp;
  String noSeluler;
  String email;
  String namaIbu;
  String relationship;
  dynamic namaPasangan;
  dynamic pekerjaanPasangan;
  dynamic tglLahirPasangan;
  dynamic tempatLahirPasangan;
  dynamic nikPasangan;
  String totalIncome;
  String bidangUsaha;
  dynamic jumlahTanggungan;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String kelurahan;
  dynamic rt;
  dynamic rw;
  dynamic kodePos;
  List<Nonfixed> nonfixed;
  List<Fixed> fixed;

  factory Mstdebitur.fromJson(Map<String, dynamic> json) => Mstdebitur(
    id: json["id"],
    noDebitur: json["no_debitur"],
    nik: json["nik"],
    namaDebitur: json["nama_debitur"],
    alamat: json["alamat"],
    tempatLahir: json["tempat_lahir"],
    tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
    pekerjaan: json["pekerjaan"],
    instansi: json["instansi"],
    agama: json["agama"],
    gender: json["gender"],
    noTelp: json["no_telp"],
    noSeluler: json["no_seluler"],
    email: json["email"],
    namaIbu: json["nama_ibu"],
    relationship: json["relationship"],
    namaPasangan: json["nama_pasangan"],
    pekerjaanPasangan: json["pekerjaan_pasangan"],
    tglLahirPasangan: json["tgl_lahir_pasangan"],
    tempatLahirPasangan: json["tempat_lahir_pasangan"],
    nikPasangan: json["nik_pasangan"],
    totalIncome: json["total_income"],
    bidangUsaha: json["bidang_usaha"],
    jumlahTanggungan: json["jumlah_tanggungan"],
    provinsi: json["provinsi"],
    kabupaten: json["kabupaten"],
    kecamatan: json["kecamatan"],
    kelurahan: json["kelurahan"],
    rt: json["rt"],
    rw: json["rw"],
    kodePos: json["kode_pos"],
    nonfixed: List<Nonfixed>.from(json["nonfixed"].map((x) => Nonfixed.fromJson(x))),
    fixed: List<Fixed>.from(json["fixed"].map((x) => Fixed.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "no_debitur": noDebitur,
    "nik": nik,
    "nama_debitur": namaDebitur,
    "alamat": alamat,
    "tempat_lahir": tempatLahir,
    "tanggal_lahir": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
    "pekerjaan": pekerjaan,
    "instansi": instansi,
    "agama": agama,
    "gender": gender,
    "no_telp": noTelp,
    "no_seluler": noSeluler,
    "email": email,
    "nama_ibu": namaIbu,
    "relationship": relationship,
    "nama_pasangan": namaPasangan,
    "pekerjaan_pasangan": pekerjaanPasangan,
    "tgl_lahir_pasangan": tglLahirPasangan,
    "tempat_lahir_pasangan": tempatLahirPasangan,
    "nik_pasangan": nikPasangan,
    "total_income": totalIncome,
    "bidang_usaha": bidangUsaha,
    "jumlah_tanggungan": jumlahTanggungan,
    "provinsi": provinsi,
    "kabupaten": kabupaten,
    "kecamatan": kecamatan,
    "kelurahan": kelurahan,
    "rt": rt,
    "rw": rw,
    "kode_pos": kodePos,
    "nonfixed": List<dynamic>.from(nonfixed.map((x) => x.toJson())),
    "fixed": List<dynamic>.from(fixed.map((x) => x.toJson())),
  };
}

class Fixed {
  Fixed({
    this.id,
    this.jenisPengajuan,
    this.plafonFasilitas,
    this.jenisPenggunaan,
    this.tujuanPenggunaan,
    this.jangkaWaktu,
    this.penghasilanPemohon,
    this.potonganGaji,
    this.sisaPenghasilan,
    this.namaPejabatPenanggungJawab,
    this.jabatanPejabatPenanggungJawab,
    this.namaPejabatPemotongGaji,
    this.jabatanPejabatPemotongGaji,
    this.noRekening,
    this.plafonKredit,
    this.tanggalMulaiKredit,
    this.jangkaWaktuKredit,
  });

  int id;
  String jenisPengajuan;
  String plafonFasilitas;
  String jenisPenggunaan;
  String tujuanPenggunaan;
  DateTime jangkaWaktu;
  String penghasilanPemohon;
  String potonganGaji;
  String sisaPenghasilan;
  String namaPejabatPenanggungJawab;
  String jabatanPejabatPenanggungJawab;
  String namaPejabatPemotongGaji;
  String jabatanPejabatPemotongGaji;
  String noRekening;
  String plafonKredit;
  DateTime tanggalMulaiKredit;
  DateTime jangkaWaktuKredit;

  factory Fixed.fromJson(Map<String, dynamic> json) => Fixed(
    id: json["id"],
    jenisPengajuan: json["jenis_pengajuan"],
    plafonFasilitas: json["plafon_fasilitas"],
    jenisPenggunaan: json["jenis_penggunaan"],
    tujuanPenggunaan: json["tujuan_penggunaan"],
    jangkaWaktu: DateTime.parse(json["jangka_waktu"]),
    penghasilanPemohon: json["penghasilan_pemohon"],
    potonganGaji: json["potongan_gaji"],
    sisaPenghasilan: json["sisa_penghasilan"],
    namaPejabatPenanggungJawab: json["nama_pejabat_penanggung_jawab"],
    jabatanPejabatPenanggungJawab: json["jabatan_pejabat_penanggung_jawab"],
    namaPejabatPemotongGaji: json["nama_pejabat_pemotong_gaji"],
    jabatanPejabatPemotongGaji: json["jabatan_pejabat_pemotong_gaji"],
    noRekening: json["no_rekening"],
    plafonKredit: json["plafon_kredit"],
    tanggalMulaiKredit: DateTime.parse(json["tanggal_mulai_kredit"]),
    jangkaWaktuKredit: DateTime.parse(json["jangka_waktu_kredit"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "jenis_pengajuan": jenisPengajuan,
    "plafon_fasilitas": plafonFasilitas,
    "jenis_penggunaan": jenisPenggunaan,
    "tujuan_penggunaan": tujuanPenggunaan,
    "jangka_waktu": "${jangkaWaktu.year.toString().padLeft(4, '0')}-${jangkaWaktu.month.toString().padLeft(2, '0')}-${jangkaWaktu.day.toString().padLeft(2, '0')}",
    "penghasilan_pemohon": penghasilanPemohon,
    "potongan_gaji": potonganGaji,
    "sisa_penghasilan": sisaPenghasilan,
    "nama_pejabat_penanggung_jawab": namaPejabatPenanggungJawab,
    "jabatan_pejabat_penanggung_jawab": jabatanPejabatPenanggungJawab,
    "nama_pejabat_pemotong_gaji": namaPejabatPemotongGaji,
    "jabatan_pejabat_pemotong_gaji": jabatanPejabatPemotongGaji,
    "no_rekening": noRekening,
    "plafon_kredit": plafonKredit,
    "tanggal_mulai_kredit": "${tanggalMulaiKredit.year.toString().padLeft(4, '0')}-${tanggalMulaiKredit.month.toString().padLeft(2, '0')}-${tanggalMulaiKredit.day.toString().padLeft(2, '0')}",
    "jangka_waktu_kredit": "${jangkaWaktuKredit.year.toString().padLeft(4, '0')}-${jangkaWaktuKredit.month.toString().padLeft(2, '0')}-${jangkaWaktuKredit.day.toString().padLeft(2, '0')}",
  };
}

class Nonfixed {
  Nonfixed({
    this.id,
    this.jenisPengajuan,
    this.plafonFasilitas,
    this.jenisPenggunaan,
    this.tujuanPenggunaan,
    this.jangkaWaktu,
    this.noRekening,
    this.plafonKredit,
    this.tanggalMulaiKredit,
    this.jangkaWaktuKredit,
  });

  int id;
  String jenisPengajuan;
  String plafonFasilitas;
  String jenisPenggunaan;
  String tujuanPenggunaan;
  String jangkaWaktu;
  dynamic noRekening;
  dynamic plafonKredit;
  dynamic tanggalMulaiKredit;
  dynamic jangkaWaktuKredit;

  factory Nonfixed.fromJson(Map<String, dynamic> json) => Nonfixed(
    id: json["id"],
    jenisPengajuan: json["jenis_pengajuan"],
    plafonFasilitas: json["plafon_fasilitas"],
    jenisPenggunaan: json["jenis_penggunaan"],
    tujuanPenggunaan: json["tujuan_penggunaan"],
    jangkaWaktu: json["jangka_waktu"],
    noRekening: json["no_rekening"],
    plafonKredit: json["plafon_kredit"],
    tanggalMulaiKredit: json["tanggal_mulai_kredit"],
    jangkaWaktuKredit: json["jangka_waktu_kredit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "jenis_pengajuan": jenisPengajuan,
    "plafon_fasilitas": plafonFasilitas,
    "jenis_penggunaan": jenisPenggunaan,
    "tujuan_penggunaan": tujuanPenggunaan,
    "jangka_waktu": jangkaWaktu,
    "no_rekening": noRekening,
    "plafon_kredit": plafonKredit,
    "tanggal_mulai_kredit": tanggalMulaiKredit,
    "jangka_waktu_kredit": jangkaWaktuKredit,
  };
}
