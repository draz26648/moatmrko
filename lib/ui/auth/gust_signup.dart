import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';
import 'package:moatamrk/ui/main_widgets/custom_text_field.dart';

import '../home_layout/home_layout.dart';

class GuestSignUpScreen extends StatefulWidget {
  const GuestSignUpScreen({Key? key}) : super(key: key);

  @override
  State<GuestSignUpScreen> createState() => _GuestSignUpScreenState();
}

class _GuestSignUpScreenState extends State<GuestSignUpScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Create An Account As Guest',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      hint: 'First Name',
                      inputType: TextInputType.text,
                      controller: _firstNameController,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      hint: 'Last Name',
                      inputType: TextInputType.text,
                      controller: _lastNameController,
                    ),
                  ),
                ],
              ),
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
                prefixIcon: Icon(Icons.email, color: mainBgCrl),
                verticalMargin: 15,
              ),
              CustomTextField(
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                hint: 'Password',
                inputType: TextInputType.text,
                controller: _passwordController,
                prefixIcon: Icon(Icons.password, color: mainBgCrl),
                icon: IconButton(
                    onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
              ),
              CustomTextField(
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Choose your Country';
                  }
                  return null;
                },
                hint: 'Egypt',
                inputType: TextInputType.emailAddress,
                controller: _countryController,
                prefixIcon: Icon(Icons.flag, color: mainBgCrl),
                verticalMargin: 15,
              ),
              CustomTextField(
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Phone';
                  }
                  return null;
                },
                hint: 'Phone',
                inputType: TextInputType.number,
                controller: _countryController,
                prefixIcon: Icon(Icons.mobile_friendly, color: mainBgCrl),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomBtn(
                text: 'Sign Up',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeLayout()));
                },
                color: mainBgCrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
