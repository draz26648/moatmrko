import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/main_widgets/custom_btn.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBgCrl,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
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
                    backgroundImage:
                        AssetImage('assets/images/splash_logo.png'),
                    backgroundColor: Colors.white,
                    radius: 47,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Card(
              elevation: 7.0,
              margin: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(height: 400, child: _buildAbout()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAbout() => Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          Text(
            'About Moatmrko Sh.a',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'A scientific conference is an event with a great importance within scientific community, fundamentally due the results obtained from it. Researchers of various research centers, laboratories, and universities have been meeting periodically according to their specific areas, in order to present their studies and thus contribute for the development of science. The preparation of a conference is not a simple activity there are several processes taking into account to promote the success of a conference. Thus it is very important develop and implement software applications capable of doing the management of scientific conferences from planning to the end of the conference.',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      );
}
