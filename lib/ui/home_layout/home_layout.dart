import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';

import '../home_screen.dart';
import '../notes_screen.dart';
import '../notification_screen.dart';
import '../qr_code_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_titles[currentIndex], style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: mainBgCrl,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'My Notes',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR Code',
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
