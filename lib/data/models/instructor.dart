import 'package:moatamrk/data/api/mapper.dart';

class InstructorModel extends SingleMapper {
  InstructorModel({
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

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      id: json["id"] == null ? null : json['id'],
      fullName: json["full_name"] == null ? null : json['full_name'],
      email: json["email"] == null ? null : json['email'],
      specialization:
          json["specialization"] == null ? null : json['specialization'],
      title: json["title"] == null ? null : json['title'],
      about: json["about"] == null ? null : json['about'],
      students: json["students"] == null ? null : json['students'],
      reviews: json["reviews"] == null ? null : json['reviews'],
      twitter: json["twitter"] == null ? null : json['twitter'],
      linkedin: json["linkedin"] == null ? null : json['linkedin'],
      img: json["img"] == null ? null : json['img'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json["updated_at"]),
    );
  }
}
