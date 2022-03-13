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
          tail(
            "Profile",
            FontAwesomeIcons.user,
            () {},
          ),
          columDiv(10),
          tail(
            "Log Out",
            FontAwesomeIcons.signOutAlt,
            () {},
          ),
          columDiv(10),
          tail(
            "About",
            FontAwesomeIcons.exclamation,
            () {},
          ),
        ]),
      ),
    );
  }

  Widget tail(
    String title,
    IconData icon,
    void Function()? onTap,
  ) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 23,
        child: FaIcon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
