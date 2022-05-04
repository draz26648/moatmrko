import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/auth/login_methods_screen.dart';
import 'package:moatamrk/ui/auth/signup_methods_screen.dart';
import 'package:moatamrk/ui/on_boarding/getStart_screen.dart';
import 'package:moatamrk/ui/on_boarding/splash_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark, statusBarColor: mainBgCrl));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moatmrko',
        home: SplashScreen());
  }
}
