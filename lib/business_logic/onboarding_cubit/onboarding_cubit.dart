import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:moatamrk/navigator/custom_navigator.dart';
import 'package:moatamrk/navigator/routes.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) =>
      BlocProvider.of<OnboardingCubit>(context);

  bool isLast = false;
  void load() {
    if (isLast) CustomNavigator.push(Routes.LOGIN);
    emit(OnboardingLoaded());
  }
}
