import 'dart:convert';

class PengumumanResponseModel {
    final bool success;
    final String message;
    final List<Pengumuman> data;

    PengumumanResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PengumumanResponseModel.fromJson(String str) => PengumumanResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PengumumanResponseModel.fromMap(Map<String, dynamic> json) => PengumumanResponseModel(
        success: json["success"],
        message: json["message"],
        data: List<Pengumuman>.from(json["data"].map((x) => Pengumuman.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Pengumuman {
    final int id;
    final String tittle;
    final String isi;
    final String lampiran;
    final DateTime createdAt;
    final DateTime updatedAt;

    Pengumuman({
        required this.id,
        required this.tittle,
        required this.isi,
        required this.lampiran,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Pengumuman.fromJson(String str) => Pengumuman.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pengumuman.fromMap(Map<String, dynamic> json) => Pengumuman(
        id: json["id"],
        tittle: json["tittle"],
        isi: json["isi"],
        lampiran: json["lampiran"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "tittle": tittle,
        "isi": isi,
        "lampiran": lampiran,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
