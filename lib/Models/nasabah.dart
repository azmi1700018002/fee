import 'dart:convert';

class Nasabah {
  int id;
  String nama_debitur;
  String alamat;
  String no_telp;
  String no_ktp;
  String no_selular;

  Nasabah({
    this.id = 0,
    this.nama_debitur,
    this.alamat,
    this.no_telp,
    this.no_ktp,
    this.no_selular,
  });

  factory Nasabah.fromJson(Map<String, dynamic> json) => Nasabah(
    id: json["id"],
    nama_debitur: json["nama_debitur"],
    alamat: json["alamat"],
    no_telp: json["no_telp"],
    no_ktp: json["no_ktp"],
    no_selular: json["no_selular"],
  );

  factory Nasabah.fromMap(Map<String, dynamic> map) => Nasabah(
    id: map["id"],
    nama_debitur: map["nama_debitur"],
    alamat: map["alamat"],
    no_telp: map["no_telp"],
    no_ktp: map["no_ktp"],
    no_selular: map["no_selular"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_debitur": nama_debitur,
    "alamat": alamat,
    "no_telp": no_telp,
    "no_ktp": no_ktp,
    "no_selular": no_selular,
  };

  @override
  String toString() {
    return 'Nasabah{id: $id, nama_debitur: $nama_debitur, alamat: $alamat, no_telp: $no_telp, no_ktp: $no_ktp, no_selular: $no_selular}';
  }
}

class NasabahResult {
  String status;
  List<Nasabah> data = new List<Nasabah>();
  NasabahResult({
    this.status,
    this.data,
  });
  factory NasabahResult.fromJson(Map<String, dynamic> data) => NasabahResult(
    status: data["status"],
    data: List<Nasabah>.from(
        data["data"].map((item) => Nasabah.fromJson(item))),
  );
}

NasabahResult nasabahResultFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return NasabahResult.fromJson(data);
}

String nasabahToJson(Nasabah nasabah) {
  final jsonData = nasabah.toJson();
  return json.encode(jsonData);
}
