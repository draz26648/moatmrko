import 'dart:convert';

InstructorProfile profileModelFromJson(String str) =>
    InstructorProfile.fromJson(json.decode(str));

String profileModelToJson(InstructorProfile data) => json.encode(data.toJson());

class InstructorProfile {
  InstructorProfile({
    this.id,
    this.fullName,
    this.email,
    this.specialization,
    this.title,
    this.about,
    this.students,
    this.reviews,
    this.twitter,
    this.linkedin,
    this.img,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? fullName;
  String? email;
  String? specialization;
  String? title;
  String? about;
  int? students;
  int? reviews;
  dynamic twitter;
  dynamic linkedin;
  dynamic img;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory InstructorProfile.fromJson(Map<String, dynamic> json) =>
      InstructorProfile(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        specialization: json["specialization"],
        title: json["title"],
        about: json["about"],
        students: json["students"],
        reviews: json["reviews"],
        twitter: json["twitter"],
        linkedin: json["linkedin"],
        img: json["img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "specialization": specialization,
        "title": title,
        "about": about,
        "students": students,
        "reviews": reviews,
        "twitter": twitter,
        "linkedin": linkedin,
        "img": img,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
