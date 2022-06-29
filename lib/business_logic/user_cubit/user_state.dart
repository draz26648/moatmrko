part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final Mapper model;
  UserLoaded({required this.model});
}

class UserError extends UserState {
  final String error;
  UserError({required this.error});
}
