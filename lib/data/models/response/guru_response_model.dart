import 'dart:convert';

class GuruResponseModel {
    final bool success;
    final String message;
    final List<Guru> data;

    GuruResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory GuruResponseModel.fromJson(String str) => GuruResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GuruResponseModel.fromMap(Map<String, dynamic> json) => GuruResponseModel(
        success: json["success"],
        message: json["message"],
        data: List<Guru>.from(json["data"].map((x) => Guru.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Guru {
    final int id;
    final String nama;
    final String nip;
    final String email;
    final String telp;
    final String alamat;
    final DateTime tanggalLahir;
    final String foto;

    Guru({
        required this.id,
        required this.nama,
        required this.nip,
        required this.email,
        required this.telp,
        required this.alamat,
        required this.tanggalLahir,
        required this.foto,
    });

    factory Guru.fromJson(String str) => Guru.fromMap(json.decode(str));

  get length => null;

    String toJson() => json.encode(toMap());

    factory Guru.fromMap(Map<String, dynamic> json) => Guru(
        id: json["id"],
        nama: json["nama"],
        nip: json["nip"],
        email: json["email"],
        telp: json["telp"],
        alamat: json["alamat"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        foto: json["foto"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "nip": nip,
        "email": email,
        "telp": telp,
        "alamat": alamat,
        "tanggal_lahir": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "foto": foto,
    };
}
