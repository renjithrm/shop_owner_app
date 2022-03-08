import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Color appBarColor = const Color(0xff008352);
Color buttonColor = const Color(0xff00D290);
EdgeInsets padding = const EdgeInsets.all(15);
String loginImage2 = "assets/login_image.png";
String loginImage = "assets/login_image2.png";

Text appTitle = Text(
  "Dunzo",
  style: GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
  ),
);

Widget titleText(String text) => Text(text,
    style: GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ));

Widget text(String text, [double? size, Color? color = Colors.grey]) => Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
      ),
    );
//colum divider.
Widget columDiv(double size) => SizedBox(
      height: size,
    );
//form field in login page.
Widget forms(String labelText, TextEditingController controller,
        String? Function(String?)? validator,
        [Widget? prefix]) =>
    Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
          labelStyle: GoogleFonts.roboto(),
          prefix: prefix,
        ),
      ),
    );

//submit button in all page.
Widget submitButton({
  required void Function()? onPressed,
  required String buttonText,
}) =>
    Container(
      height: 60,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.pressed)
                    ? appBarColor
                    : buttonColor)),
      ),
    );
// Widget textButton(
//         {required void Function()? onPressed,
//         required Widget icon,
//         required Widget label}) =>
//     TextButton.icon(
//       onPressed: onPressed,
//       icon: icon,
//       label: label,
//     );

//drawer button in home screen.
Widget drawerButton({
  IconData? icon,
  Widget? title,
  void Function()? onTap,
}) =>
    ListTile(
      leading: FaIcon(
        icon,
        color: Colors.black,
      ),
      title: title,
      onTap: onTap,
    );
