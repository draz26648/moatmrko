import '../../data/models/login_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final LoginModel registerModel;

  RegisterSuccess({required this.registerModel});
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);
}
