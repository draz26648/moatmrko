import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatamrk/business_logic/login_cubit/login_cubit.dart';
import 'package:moatamrk/navigator/custom_navigator.dart';
import 'package:moatamrk/navigator/routes.dart';

import '../../constant/colors.dart';
import '../main_widgets/custom_btn.dart';
import '../main_widgets/custom_text_field.dart';

class InstructorSignInScreen extends StatefulWidget {
  const InstructorSignInScreen({Key? key}) : super(key: key);

  @override
  State<InstructorSignInScreen> createState() => _InstructorSignInScreenState();
}

class _InstructorSignInScreenState extends State<InstructorSignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CustomTextField(
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  controller: _emailController,
                  verticalMargin: 10,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  hint: 'Password',
                  secureText: true,
                  inputType: TextInputType.text,
                  controller: _passwordController,
                  icon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _isChecked,
                        onChanged: (v) {
                          setState(() {
                            _isChecked = v!;
                          });
                        }),
                    const Text('Remember me'),
                  ],
                ),
              ],
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CustomBtn(
                      text: 'Sign In',
                      onTap: () {
                        context.read<LoginCubit>().instructorLogin(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                      },
                      color: mainBgCrl,
                    ),
                    TextButton(
                        onPressed: () {}, child: Text('Forgot Password?')),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
