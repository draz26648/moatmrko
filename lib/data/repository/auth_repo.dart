import 'package:dio/dio.dart';
import 'package:moatamrk/constant/end_points.dart';
import 'package:moatamrk/data/api/network_helper.dart';
import 'package:moatamrk/data/models/instructor_login_model.dart';
import 'package:moatamrk/data/models/login_model.dart';

abstract class AuthRepo {
  static login({
    required String email,
    required String password,
  }) async {
    FormData _body = FormData.fromMap({
      'email': email,
      'password': password,
    });
    return await NetworkHelper()
        .post(url: EndPoints.GUEST_LOGIN, body: _body, model: LoginModel());
  }

  static gustRegister({
    required String full_name,
    required String email,
    required String password,
  }) async {
    FormData _body = FormData.fromMap({
      'full_name': full_name,
      'email': email,
      'password': password,
    });

    return await NetworkHelper()
        .post(url: EndPoints.GUEST_REGISTER, body: _body, model: LoginModel());
  }

  static instructorLogin({
    required String email,
    required String password,
  }) async {
    FormData _body = FormData.fromMap({
      'email': email,
      'password': password,
    });
    return await NetworkHelper().post(
        url: EndPoints.INSTRUCTOR_LOGIN,
        body: _body,
        model: InstructorLoginModel());
  }

  static instructorRegister() {}
}
