part of 'instructors_cubit.dart';

@immutable
abstract class InstructorsState {}

class InstructorsInitial extends InstructorsState {}

class InstructorLoading extends InstructorsState {}

class InstructorsLoaded extends InstructorsState {
  final List<AllInstructorsModel> instructors;
  InstructorsLoaded({required this.instructors});
}

class InstructorError extends InstructorsState {
  final String error;
  InstructorError({required this.error});
}
