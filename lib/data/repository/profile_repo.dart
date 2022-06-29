import 'package:dio/dio.dart';
import 'package:moatamrk/constant/end_points.dart';
import 'package:moatamrk/data/api/network.dart';
import 'package:moatamrk/data/models/profile_model.dart';
import 'package:moatamrk/helpers/shared_helper.dart';

abstract class ProfileRepo {
  static getProfile({
    required int id,
  }) async {
    return await NetworkHelper()
        .get(url: 'guest/profile/$id', model: ProfileModel());
  }

  static getInstructorProfile({
    required int id,
  }) async {
    return await NetworkHelper()
        .get(url: 'instructor/profile/$id', model: ProfileModel());
  }

  static logout() async {
    String _token = await SharedHelper().readString(CachingKey.TOKEN);
    FormData _body = FormData.fromMap({
      'remember_token': _token,
    });
    return await NetworkHelper().post(url: EndPoints.GUEST_LOGOUT, body: _body);
  }

  static instructorLogout() async {
    String _token = await SharedHelper().readString(CachingKey.TOKEN);
    FormData _body = FormData.fromMap({
      'remember_token': _token,
    });
    return await NetworkHelper()
        .post(url: EndPoints.INSTRUCTOR_LOGOUT, body: _body);
  }
}
