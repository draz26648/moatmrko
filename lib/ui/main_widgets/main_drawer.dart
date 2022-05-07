import 'package:flutter/material.dart';
import 'package:moatamrk/constant/colors.dart';
import 'package:moatamrk/ui/about_screen.dart';

import '../notes_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback handelar) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
      ),
      onTap: handelar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            alignment: Alignment.center,
            color: mainBgCrl,
            child: Center(
              child: Text(
                "Moatamrk",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  color: mainBgCrl,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Agenda', Icons.book, () {Navigator.push(context, MaterialPageRoute(builder: (context) => NoteScreen()));}),
          buildListTile('Sessions', Icons.timelapse, () {}),
          buildListTile('Speakers', Icons.person, () {}),
          buildListTile('About Us', Icons.list_alt, () {Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));}),
          buildListTile('Settings', Icons.settings, () {}),
          buildListTile('Logout', Icons.logout, () {}),
        ],
      ),
    );
  }
}
