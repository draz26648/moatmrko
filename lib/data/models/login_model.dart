import 'package:moatamrk/data/api/mapper.dart';
import 'package:moatamrk/data/models/base_models/profile.dart';

class LoginModel extends SingleMapper {
  LoginModel({
    this.rememberToken,
    this.profile,
  });
  String? rememberToken;
  Profile? profile;
  @override
  Mapper fromJson(Map<String, dynamic> json) {
    return LoginModel(
      rememberToken:
          json["remember_token"] == null ? null : json["remember_token"],
      profile:
          json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    );
  }
}
