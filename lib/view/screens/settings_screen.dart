import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/helpers/const.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: padding,
        child: Column(children: <Widget>[
          profileTail(),
          columDiv(10),
          logOutTail(),
        ]),
      ),
    );
  }

  Widget profileTail() {
    return ListTile(
      onTap: () {},
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 27,
        child: FaIcon(
          FontAwesomeIcons.user,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Profile",
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget logOutTail() {
    return ListTile(
      onTap: () {},
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 27,
        child: FaIcon(
          FontAwesomeIcons.signOutAlt,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Log out",
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
