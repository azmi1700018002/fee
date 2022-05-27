class User{
  int id;
  String username, email, nama_lengkap;

  User({this.id, this.username, this.email, this.nama_lengkap});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      nama_lengkap: json['nama_lengkap'],
    );
  }
}