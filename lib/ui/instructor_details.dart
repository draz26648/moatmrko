import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/data/models/all_insturctorsModel.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';
import 'package:moatamrk/ui/profile_setting_screen.dart';

class InstructorDetails extends StatelessWidget {
  final AllInstructorsModel model;
  const InstructorDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBgCrl,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
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
                    Text(
                      '${model.fullName} \n${model.specialization}',
                      style: TextStyle(color: white, fontSize: 25),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 122,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(150)),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Text(
                    'About DR ${model.fullName} :',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    model.about!,
                    style: const TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Email - ${model.email}'),
          const SizedBox(
            height: 20,
          ),
          Text('phone - ${model.twitter}'),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
