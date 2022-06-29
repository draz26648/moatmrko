import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/helpers/shared_helper.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'main_widgets/custom_btn.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  int id = 0;
  updateID() async {
    id = await SharedHelper().readInteger(CachingKey.PROFILE_ID);
  }

  @override
  void initState() {
    updateID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: mainBgCrl,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImage(
                data: '$id',
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Please scan your QR code to attend sessions',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
