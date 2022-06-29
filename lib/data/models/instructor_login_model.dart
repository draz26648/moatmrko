import 'package:moatamrk/data/api/mapper.dart';
import 'package:moatamrk/data/models/base_models/instructor_profile.dart';

class InstructorLoginModel extends SingleMapper {
  InstructorLoginModel({this.rememberToken, this.profile});
  String? rememberToken;
  InstructorProfile? profile;

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    return InstructorLoginModel(
        rememberToken:
            json['remember_token'] == null ? null : json['remember_token'],
        profile: json['profile'] == null
            ? null
            : InstructorProfile.fromJson(
                json['profile'],
              ));
  }
}
