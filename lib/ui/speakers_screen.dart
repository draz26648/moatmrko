import 'package:flutter/material.dart';
import 'package:moatamrk/ui/main_widgets/custom_text_field.dart';
import 'package:moatamrk/ui/speaker_screen.dart';

import '../constant/colors.dart';

class SpeakersScreen extends StatefulWidget {
  const SpeakersScreen({Key? key}) : super(key: key);

  @override
  State<SpeakersScreen> createState() => _SpeakersScreenState();
}

class _SpeakersScreenState extends State<SpeakersScreen> {
  List<Map<String, dynamic>> eventDoctors = [
    {
      'name': 'Dr. Negm Eldeen',
      'image': 'assets/images/doc1.png',
      'section': 'Operating System',
    },
    {
      'name': 'Dr. Amr ELmaghraby',
      'image': 'assets/images/doc2.png',
      'section': 'Database',
    },
    {
      'name': 'Dr. Emad ELdeen',
      'image': 'assets/images/doc4.png',
      'section': 'Network&secuirty',
    },
    {
      'name': 'Dr. Mahmoud Rehan',
      'image': 'assets/images/doc3.png',
      'section': 'Programming',
    },
    {
      'name': 'Dr. Eman Wadea',
      'image': 'assets/images/splash_logo.png',
      'section': 'Management',
    },
  ];

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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: mainBgCrl,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('Speakers',
                      style: TextStyle(color: white, fontSize: 25)),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    label: 'Search',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              height: 600,
              padding: const EdgeInsets.all(8),
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: eventDoctors.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SpeakerScreen(
                                        image: eventDoctors[index]['image'],
                                        speakerName: eventDoctors[index]
                                            ['name'],
                                        speakerBio: eventDoctors[index]
                                            ['section'],
                                      )));
                        },
                        child: _buildSearchItem(
                            eventDoctors[index]['image'],
                            eventDoctors[index]['name'],
                            eventDoctors[index]['section']),
                      )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchItem(String? image, String? name, String? bio) =>
      Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: mainBgCrl, width: 1),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image!),
              backgroundColor: Colors.white,
              radius: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name!,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  bio!,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
          ],
        ),
      );
}
