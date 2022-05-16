import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moatamrk/bloc_observer.dart';
import 'package:moatamrk/business_logic/onboarding_cubit/onboarding_cubit.dart';
import 'package:moatamrk/business_logic/splash_cubit/splash_cubit.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/navigator/custom_navigator.dart';
import 'package:moatamrk/navigator/routes.dart';

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
          create: (context) => SplashCubit(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(),
        ),
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
