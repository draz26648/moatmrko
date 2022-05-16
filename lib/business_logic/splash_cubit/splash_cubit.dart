import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:meta/meta.dart';
import 'package:moatamrk/navigator/custom_navigator.dart';
import 'package:moatamrk/navigator/routes.dart';

import '../../helpers/shared_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(context) => BlocProvider.of<SplashCubit>(context);

  void initialization() async {
    bool? _first = await SharedHelper().readBoolean(CachingKey.FIRST_TIME);
    String? _token = await SharedHelper().readString(CachingKey.TOKEN);
    FlutterNativeSplash.remove();
    emit(SplashLoading());

    await Future.delayed(const Duration(seconds: 3), () {
      if (_first == null) {
        SharedHelper().writeData(CachingKey.FIRST_TIME, false);
        CustomNavigator.push(Routes.INTRO, clean: true);
        emit(SplashLoaded());
      } else {
        if (_token == null) {
          CustomNavigator.push(Routes.LOGIN, clean: true);
        }
      }
    });
  }
}
