class Nasabah{
  int id;
  String nama_debitur, alamat, no_telp, no_ktp, no_selular;
  Nasabah({this.id, this.nama_debitur, this.alamat, this.no_telp, this.no_ktp, this.no_selular});

  factory Nasabah.fromJson(Map<String, dynamic> json){
    return Nasabah(
      id: json['id'],
      nama_debitur: json['nama_debitur'],
      alamat: json['alamat'],
      no_telp: json['no_telp'],
      no_ktp: json['no_ktp'],
      no_selular: json['no_selular'],
    );
  }
}