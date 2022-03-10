import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/helpers/const.dart';

class LoginScreen extends StatelessWidget {
  bool isKeybordVisible;
  LoginScreen({Key? key, required this.isKeybordVisible}) : super(key: key);

  final storeName = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var isKeybordVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    print(isKeybordVisible);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: padding,
      child: Column(children: <Widget>[
        SizedBox(
            height: !isKeybordVisible ? 300 : 100,
            child: !isKeybordVisible
                ? Image(
                    image: AssetImage(loginImage),
                    fit: BoxFit.cover,
                  )
                : Text(
                    "Show with dunzo",
                    style: GoogleFonts.roboto(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
        forms(
          "Store name",
          storeName,
          (value) => null,
        ),
        forms(
          "Password",
          password,
          (value) => null,
        ),
        columDiv(20),
        submitButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/home");
          },
          buttonText: "Submit",
        ),
        TextButton(
            onPressed: () {
              Get.find<Controller>().toggleScreens();
            },
            child: const Text("Create an acount"))
      ]),
    );
  }
}
