import 'dart:convert';

class ProfileResponseModel {
    final bool success;
    final String message;
    final Profile data;

    ProfileResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ProfileResponseModel.fromJson(String str) => ProfileResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProfileResponseModel.fromMap(Map<String, dynamic> json) => ProfileResponseModel(
        success: json["success"],
        message: json["message"],
        data: Profile.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data.toMap(),
    };
}

class Profile {
    final int id;
    final String title;
    final String image;
    final dynamic logo;
    final String sejarah;
    final String visi;
    final List<String> misi;
    final String lokasi;
    final DateTime createdAt;
    final DateTime updatedAt;

    Profile({
        required this.id,
        required this.title,
        required this.image,
        required this.logo,
        required this.sejarah,
        required this.visi,
        required this.misi,
        required this.lokasi,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Profile.fromMap(Map<String, dynamic> json) => 
    Profile(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        logo: json["logo"],
        sejarah: json["sejarah"],
        visi: json["visi"],
        misi: List<String>.from(jsonDecode(json['misi']) as List),
        lokasi: json["lokasi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": image,
        "logo": logo,
        "sejarah": sejarah,
        "visi": visi,
        "misi": jsonEncode(misi),
        "lokasi": lokasi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
