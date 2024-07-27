import 'dart:convert';

class EventResponseModel {
    final bool success;
    final String message;
    final List<Event> data;

    EventResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory EventResponseModel.fromJson(String str) => EventResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EventResponseModel.fromMap(Map<String, dynamic> json) => EventResponseModel(
        success: json["success"],
        message: json["message"],
        data: List<Event>.from(json["data"].map((x) => Event.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Event {
    final int id;
    final String tittle;
    final String content;
    final String foto;
    final DateTime createdAt;
    final DateTime updatedAt;

    Event({
        required this.id,
        required this.tittle,
        required this.content,
        required this.foto,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Event.fromMap(Map<String, dynamic> json) => Event(
        id: json["id"],
        tittle: json["tittle"],
        content: json["content"],
        foto: json["foto"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "tittle": tittle,
        "content": content,
        "foto": foto,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
