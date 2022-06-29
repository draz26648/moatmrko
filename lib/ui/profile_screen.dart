import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatamrk/business_logic/user_cubit/user_cubit.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/data/models/instructor.dart';
import 'package:moatamrk/data/models/profile_model.dart';
import 'package:moatamrk/helpers/shared_helper.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';
import 'package:moatamrk/ui/profile_setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileModel? model;

  InstructorModel? instructorModel;

  @override
  void initState() {
    context.read<UserCubit>().getProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBgCrl,
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserLoaded) {
            // if () {
            //   model = state.model as ProfileModel;
            //   setState(() {});
            // } else if (isInstructor!) {
            //   instructorModel = state.model as InstructorModel;
            //   setState(() {});
            // }
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: mainBgCrl,
              ),
            );
          } else {
            return Column(
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
                        '',
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
                                  builder: (context) =>
                                      const ProfileSettingScreen()));
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
                        onTap: () {
                          context.read<UserCubit>().logout();
                        },
                        color: white,
                        txtColor: mainBgCrl,
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
