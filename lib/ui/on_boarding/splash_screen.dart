import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moatamrk/business_logic/splash_cubit/splash_cubit.dart';
import 'package:moatamrk/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //initialize the splash screen

  @override
  void initState() {
    SplashCubit.get(context).initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBgCrl,
      ),
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return SafeArea(
            child: Container(
              color: mainBgCrl,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Image.asset('assets/images/splash_logo.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
