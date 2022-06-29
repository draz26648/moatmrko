import 'package:moatamrk/data/api/mapper.dart';

class ProfileModel extends SingleMapper {
  ProfileModel({
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

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"] == null ? null : json['id'],
      fullName: json["full_name"] == null ? null : json['full_name'],
      email: json["email"] == null ? null : json['email'],
      img: json["img"] == null ? null : json['img'],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
    );
  }
}
