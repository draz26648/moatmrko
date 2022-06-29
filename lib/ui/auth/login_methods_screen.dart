import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/navigator/custom_navigator.dart';
import 'package:moatamrk/navigator/routes.dart';
import 'package:moatamrk/ui/auth/sign_in_screen.dart';
import 'package:moatamrk/ui/auth/signup_methods_screen.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';
import 'package:moatamrk/ui/on_boarding/on_borading_screen.dart';

class LoginMethodsScreen extends StatefulWidget {
  const LoginMethodsScreen({Key? key}) : super(key: key);

  @override
  State<LoginMethodsScreen> createState() => _LoginMethodsScreenState();
}

class _LoginMethodsScreenState extends State<LoginMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBgCrl,
      ),
      body: SafeArea(
        child: Container(
          color: mainBgCrl,
          padding: const EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image.asset('assets/images/splash_logo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomBtn(
                text: 'Create New Account',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpMethodsScreen(),
                      ));
                },
                color: white,
                txtColor: black,
              ),
              CustomBtn(
                text: 'Sign In',
                onTap: () {
                  CustomNavigator.push(Routes.LoginMethods);
                },
                color: white,
                txtColor: black,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
