class Profile {
  Profile({
    this.id,
    this.fullName,
    this.email,
    this.img,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? fullName;
  String? email;
  dynamic img;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        img: json["img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "img": img,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
