import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moatamrk/bloc_observer.dart';
import 'package:moatamrk/business_logic/events_cubit/events_cubit.dart';
import 'package:moatamrk/business_logic/login_cubit/login_cubit.dart';
import 'package:moatamrk/business_logic/onboarding_cubit/onboarding_cubit.dart';
import 'package:moatamrk/business_logic/register_cubit/gust_register_cubit.dart';
import 'package:moatamrk/business_logic/register_cubit/instructor_register_cubit.dart';
import 'package:moatamrk/business_logic/splash_cubit/splash_cubit.dart';
import 'package:moatamrk/business_logic/user_cubit/user_cubit.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/navigator/custom_navigator.dart';
import 'package:moatamrk/navigator/routes.dart';

import 'business_logic/instructors_cubit/instructors_cubit.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark, statusBarColor: mainBgCrl));
  BlocOverrides.runZoned(
    (() => runApp(const MyApp())),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (_) => SplashCubit(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (_) => OnboardingCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(),
        ),
        BlocProvider<GustRegisterCubit>(
          create: (_) => GustRegisterCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => UserCubit(),
        ),
        BlocProvider<EventsCubit>(
          create: (_) => EventsCubit(),
        ),
        BlocProvider<InstructorsCubit>(
          create: (_) => InstructorsCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moatmrko',
        initialRoute: Routes.SPLASH,
        navigatorKey: CustomNavigator.navigatorState,
        onGenerateRoute: CustomNavigator.onGenerateRoute,
      ),
    );
  }
}
