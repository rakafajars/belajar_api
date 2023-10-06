class LoginModel {
  String status;
  String token;
  int id;
  int tweakId;
  String nama;
  String namaBelakang;
  String username;
  String noHp;
  String email;
  int tweakPoint;
  String emergencyCp;
  String emergencyCPhone;
  String socialMedia;
  String jenisKelamin;
  bool firstLogin;

  LoginModel({
    required this.status,
    required this.token,
    required this.id,
    required this.tweakId,
    required this.nama,
    required this.namaBelakang,
    required this.username,
    required this.noHp,
    required this.email,
    required this.tweakPoint,
    required this.emergencyCp,
    required this.emergencyCPhone,
    required this.socialMedia,
    required this.jenisKelamin,
    required this.firstLogin,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        token: json["token"],
        id: json["id"],
        tweakId: json["tweakId"],
        nama: json["nama"],
        namaBelakang: json["namaBelakang"],
        username: json["username"],
        noHp: json["noHp"],
        email: json["email"],
        tweakPoint: json["tweakPoint"],
        emergencyCp: json["emergencyCP"],
        emergencyCPhone: json["emergencyCPhone"],
        socialMedia: json["socialMedia"],
        jenisKelamin: json["jenisKelamin"],
        firstLogin: json["firstLogin"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "id": id,
        "tweakId": tweakId,
        "nama": nama,
        "namaBelakang": namaBelakang,
        "username": username,
        "noHp": noHp,
        "email": email,
        "tweakPoint": tweakPoint,
        "emergencyCP": emergencyCp,
        "emergencyCPhone": emergencyCPhone,
        "socialMedia": socialMedia,
        "jenisKelamin": jenisKelamin,
        "firstLogin": firstLogin,
      };
}
