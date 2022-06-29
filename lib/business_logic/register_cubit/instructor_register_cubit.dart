import 'package:bloc/bloc.dart';
import 'package:moatamrk/business_logic/register_cubit/register_state.dart';

class InstructorCubit extends Cubit<RegisterState> {
  InstructorCubit() : super(RegisterInitial());

  void register() {}
}
