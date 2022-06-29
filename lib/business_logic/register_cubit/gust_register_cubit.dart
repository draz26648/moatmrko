import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moatamrk/business_logic/register_cubit/register_state.dart';
import 'package:moatamrk/data/models/login_model.dart';
import 'package:moatamrk/data/repository/auth_repo.dart';
import 'package:moatamrk/helpers/shared_helper.dart';

class GustRegisterCubit extends Cubit<RegisterState> {
  GustRegisterCubit() : super(RegisterInitial());

  void register({
    required String full_name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      LoginModel _res = await AuthRepo.gustRegister(
        full_name: full_name,
        email: email,
        password: password,
      );
      if (_res.rememberToken != null) {
        await SharedHelper().writeData(CachingKey.TOKEN, _res.rememberToken);
        await SharedHelper().writeData(CachingKey.PROFILE_ID, _res.profile!.id);
        await SharedHelper().writeData(CachingKey.IS_INSTRUCTOR, false);
        emit(RegisterSuccess(registerModel: _res));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
