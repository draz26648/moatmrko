import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';

class SpeakerScreen extends StatelessWidget {
  final String image;
  final String speakerName;
  final String speakerBio;
  const SpeakerScreen(
      {Key? key,
      required this.image,
      required this.speakerName,
      required this.speakerBio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speaker'),
        centerTitle: true,
        backgroundColor: mainBgCrl,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      speakerName,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      speakerBio,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Text(
                      '3:00 - 4:00',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const Text(
                      'Hall 1H',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                CustomBtn(
                  text: 'Join',
                  onTap: () {},
                  color: mainBgCrl,
                  txtColor: white,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBtn(
                  text: 'Add to my agenda',
                  onTap: () {},
                  color: white,
                  txtColor: mainBgCrl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
