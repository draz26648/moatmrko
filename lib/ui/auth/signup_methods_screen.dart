import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/auth/gust_signup.dart';
import 'package:moatamrk/ui/auth/instractor_signup.dart';

import '../main_widgets/custom_btn.dart';

class SignUpMethodsScreen extends StatelessWidget {
  const SignUpMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBgCrl,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(color: mainBgCrl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomBtn(
                text: 'Instractor',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InstractorSignUpScreen(),
                    ),
                  );
                },
                color: white,
                txtColor: black,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomBtn(
                text: 'Guest',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GuestSignUpScreen(),
                    ),
                  );
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
