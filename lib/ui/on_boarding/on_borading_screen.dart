import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatamrk/business_logic/onboarding_cubit/onboarding_cubit.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/login_methods_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var boardController = PageController();
    List<BoardingModel> boarding = [
      BoardingModel(
        image: 'assets/images/onboarding2.jpg',
        title: 'QR Code Ticket',
        body:
            'you get your QR ticket so that you can it on the day of the event to verify your registration',
      ),
      BoardingModel(
        image: 'assets/images/onboarding1.jpg',
        title: 'Attend Session',
        body:
            'check the session that interested and join it easily through the App',
      ),
    ];

    bool isLast = false;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBgCrl,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginMethodsScreen(),
                  ),
                  (route) => false);
            },
            child: Text(
              'Skip',
              style: TextStyle(color: white),
            ),
          ),
        ],
      ),
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Container(
            color: mainBgCrl,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: boardController,
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          OnboardingCubit.get(context).isLast = true;
                        }
                      },
                      itemBuilder: (context, index) =>
                          buildBoardingItem(boarding[index]),
                      itemCount: boarding.length,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        count: boarding.length,
                        effect: ExpandingDotsEffect(
                          dotColor: white,
                          dotHeight: 10,
                          dotWidth: 10,
                          expansionFactor: 3.5,
                          spacing: 5,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 40,
                        child: CustomBtn(
                            text: 'Next',
                            txtColor: black,
                            color: white,
                            onTap: () {
                              if (isLast == true) {
                                OnboardingCubit.get(context).load();
                              } else {
                                boardController.nextPage(
                                  duration: const Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              }
                            }),
                      )
                    ],
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

Widget buildBoardingItem(
  BoardingModel model,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.title,
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: white),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.body,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
