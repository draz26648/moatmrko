import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';
import 'package:moatamrk/ui/profile_setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBgCrl,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: mainBgCrl,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Mohamed@sha.com',
                  style: TextStyle(color: white, fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                CustomBtn(
                  text: 'Account Setting',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileSettingScreen()));
                  },
                  color: white,
                  txtColor: mainBgCrl,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomBtn(
                  text: 'My Agenda',
                  onTap: () {},
                  color: white,
                  txtColor: mainBgCrl,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomBtn(
                  text: 'switch Account',
                  onTap: () {},
                  color: white,
                  txtColor: mainBgCrl,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomBtn(
                  text: 'Log out',
                  onTap: () {},
                  color: white,
                  txtColor: mainBgCrl,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
