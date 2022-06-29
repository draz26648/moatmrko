import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';

import '../home_screen.dart';
import '../notes_screen.dart';
import '../notification_screen.dart';
import '../qr_code_screen.dart';

class HomeLayout extends StatefulWidget {
  final int index;
  const HomeLayout({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  onTap(index) {
    if (mounted) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  List<String> _titles = ['Home', 'Notes', 'Notification', 'QR Code'];

  List pages = [
    HomeScreen(),
    NotificationScreen(),
    NoteScreen(),
    QRScreen(),
  ];

  @override
  void initState() {
    currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: mainBgCrl,
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'My ِAgenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR Code',
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
