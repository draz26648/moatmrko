import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/home_layout/home_layout.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';
import 'package:moatamrk/ui/main_widgets/custom_text_field.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Electronic Payment',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                validate: (v) {
                  if (v.isEmpty) {
                    return 'Please enter your first name';
                  } else {
                    return null;
                  }
                },
                hint: 'Choose Card Type',
                inputType: TextInputType.text,
                prefixIcon: Icon(Icons.card_membership),
                verticalMargin: 15,
              ),
              CustomTextField(
                validate: (v) {
                  if (v.isEmpty) {
                    return 'Please enter your first name';
                  } else {
                    return null;
                  }
                },
                hint: 'Card Number',
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextField(
                      validate: (v) {
                        if (v.isEmpty) {
                          return 'Please enter your first name';
                        } else {
                          return null;
                        }
                      },
                      hint: 'MM',
                      inputType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      validate: (v) {
                        if (v.isEmpty) {
                          return 'Please enter your first name';
                        } else {
                          return null;
                        }
                      },
                      hint: 'YY',
                      inputType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    'EXPIRE DATE',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )),
                ],
              ),
              CustomTextField(
                validate: (v) {
                  if (v.isEmpty) {
                    return 'Please enter your first name';
                  } else {
                    return null;
                  }
                },
                hint: 'CVV',
                inputType: TextInputType.number,
                verticalMargin: 15,
              ),
              CustomBtn(
                  text: 'Sign Up',
                  color: mainBgCrl,
                  txtColor: white,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeLayout()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
