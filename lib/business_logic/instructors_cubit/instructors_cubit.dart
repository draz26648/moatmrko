import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moatamrk/data/models/all_insturctorsModel.dart';
import 'package:moatamrk/data/repository/data_repo.dart';

part 'instructors_state.dart';

class InstructorsCubit extends Cubit<InstructorsState> {
  InstructorsCubit() : super(InstructorsInitial());
  List<AllInstructorsModel> instructors = [];
  void getAllInstructors() async {
    emit(InstructorLoading());
    try {
      await DataRepo.getAllInstructors().then((value) {
        instructors = value;
        emit(InstructorsLoaded(instructors: value));
      });
    } catch (e) {
      emit(InstructorError(error: e.toString()));
    }
  }
}
