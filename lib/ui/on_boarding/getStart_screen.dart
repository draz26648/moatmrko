import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';

class GetStatrScreen extends StatelessWidget {
  const GetStatrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Color(0xff1D0536),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/getstartbg.png',
                  ),
                  fit: BoxFit.fitHeight)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'sign up create new account so that you can get your ticket andattend the event',
                  style: TextStyle(color: white, fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBtn(
                  text: 'Get Start',
                  onTap: () {},
                  color: mainBgCrl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
