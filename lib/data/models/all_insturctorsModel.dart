import 'dart:convert';

List<AllInstructorsModel> allInstructorsModelFromJson(String str) =>
    List<AllInstructorsModel>.from(
        json.decode(str).map((x) => AllInstructorsModel.fromJson(x)));

String allInstructorsModelToJson(List<AllInstructorsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllInstructorsModel {
  AllInstructorsModel({
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
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory AllInstructorsModel.fromJson(Map<String, dynamic> json) =>
      AllInstructorsModel(
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
        img: json["img"] == null ? null : json["img"],
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
        "img": img == null ? null : img,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
