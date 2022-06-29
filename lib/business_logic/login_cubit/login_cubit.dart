import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moatamrk/data/api/mapper.dart';
import 'package:moatamrk/data/models/instructor_login_model.dart';
import 'package:moatamrk/data/repository/auth_repo.dart';
import 'package:moatamrk/helpers/shared_helper.dart';

import '../../data/models/login_model.dart';
import '../../navigator/custom_navigator.dart';
import '../../navigator/routes.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({
    required String email,
    required String password,
    required bool isRemeber,
    required bool isInstructor,
  }) async {
    emit(LoginLoading());
    try {
      LoginModel? _res;
      if (!isInstructor) {
        _res = await AuthRepo.login(
          email: email,
          password: password,
        );
      } else if (isInstructor) {
        _res = await AuthRepo.instructorLogin(
          email: email,
          password: password,
        );
      }

      await SharedHelper().writeData(CachingKey.TOKEN, _res!.rememberToken);
      await SharedHelper().writeData(CachingKey.IS_INSTRUCTOR, false);
      await SharedHelper().writeData(CachingKey.PROFILE_ID, _res.profile!.id);

      if (_res.profile != null) {
        emit(LoginSuccess(loginModel: _res));
        CustomNavigator.push(
          Routes.HOME,
          clean: true,
        );
        if (isRemeber) {
          await SharedHelper()
              .writeData(CachingKey.USER, json.encode(_res.profile));
        }
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  void instructorLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      InstructorLoginModel _res =
          await AuthRepo.instructorLogin(email: email, password: password);
      if (_res.rememberToken != null) {
        await SharedHelper().writeData(CachingKey.TOKEN, _res.rememberToken);
        await SharedHelper().writeData(CachingKey.IS_INSTRUCTOR, true);
        await SharedHelper().writeData(CachingKey.PROFILE_ID, _res.profile!.id);
        CustomNavigator.push(Routes.HOME, clean: true, arguments: '1');
        emit(LoginSuccess(loginModel: _res));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
