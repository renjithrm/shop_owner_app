import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
// bottom sheet
showBottomSheets({
  void Function()? onTapCamera,
  void Function()? onTapGallery,
}) async {
  return await Get.bottomSheet(
    Container(
      padding: padding,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      height: 150,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onTapCamera,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: const Center(
                child: FaIcon(FontAwesomeIcons.camera),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: onTapGallery,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: const Center(
                child: FaIcon(FontAwesomeIcons.image),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
