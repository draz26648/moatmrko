import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:moatamrk/data/api/mapper.dart';
import 'package:moatamrk/data/models/base_models/profile.dart';
import 'package:moatamrk/data/models/instructor.dart';
import 'package:moatamrk/data/models/profile_model.dart';
import 'package:moatamrk/data/repository/profile_repo.dart';
import 'package:moatamrk/helpers/shared_helper.dart';
import 'package:moatamrk/navigator/custom_navigator.dart';
import 'package:moatamrk/navigator/routes.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getProfile() async {
    bool isInstructor =
        await SharedHelper().readBoolean(CachingKey.IS_INSTRUCTOR);
    if (!isInstructor) {
      emit(UserLoading());
      try {
        ProfileModel _res = await ProfileRepo.getProfile(
            id: await SharedHelper().readInteger(CachingKey.PROFILE_ID));
        if (_res.id != null) {
          emit(UserLoaded(model: _res));
        }
      } catch (e) {
        emit(UserError(error: e.toString()));
      }
    } else if (isInstructor) {
      emit(UserLoading());
      try {
        InstructorModel _res = await ProfileRepo.getInstructorProfile(
            id: await SharedHelper().readInteger(CachingKey.PROFILE_ID));
        if (_res.id != null) {
          emit(UserLoaded(model: _res));
        }
      } catch (e) {
        emit(UserError(error: e.toString()));
      }
    }
  }

  void logout() async {
    bool isInstructor =
        await SharedHelper().readBoolean(CachingKey.IS_INSTRUCTOR);
    if (!isInstructor) {
      Response _res = await ProfileRepo.logout();

      if (_res.statusCode == 200) {
        await SharedHelper().removeData(CachingKey.TOKEN);
        await SharedHelper().removeData(CachingKey.USER);
        CustomNavigator.push(Routes.LOGIN, clean: true);
      } else {
        print('There\'s an error ocurred');
      }
    } else if (isInstructor) {
      Response _res = await ProfileRepo.instructorLogout();

      if (_res.statusCode == 200) {
        await SharedHelper().removeData(CachingKey.TOKEN);
        CustomNavigator.push(Routes.LOGIN, clean: true);
      } else {
        print('There\' an error ocurred');
      }
    }
  }
}
