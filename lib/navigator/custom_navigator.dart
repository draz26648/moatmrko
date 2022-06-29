import 'package:flutter/material.dart';
import 'package:moatamrk/ui/auth/login_methods.dart';
import 'package:moatamrk/ui/home_layout/home_layout.dart';
import 'package:moatamrk/ui/on_boarding/splash_screen.dart';

import '../ui/auth/login_methods_screen.dart';
import '../ui/auth/payment_screen.dart';
import '../ui/auth/signup_methods_screen.dart';
import '../ui/home_screen.dart';
import '../ui/on_boarding/on_borading_screen.dart';
import 'routes.dart';

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      new GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.INTRO:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.REGISTER:
        return MaterialPageRoute(builder: (_) => const SignUpMethodsScreen());
      case Routes.LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginMethodsScreen());
      case Routes.HOME:
        return MaterialPageRoute(
            builder: (_) => HomeLayout(
                  index: 0,
                ));
      case Routes.PaymentScreen:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case Routes.LoginMethods:
        return MaterialPageRoute(builder: (_) => const LoginMethods());
    }
    return MaterialPageRoute(builder: (_) => Container());
  }

  static pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
