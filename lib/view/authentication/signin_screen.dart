import 'package:flutter/material.dart';
import 'package:showp_owner_app/helpers/const.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final storeName = TextEditingController();
  final cityName = TextEditingController();
  final location = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final conformPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: padding,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                titleText("Sell your Products on Dunzo"),
                columDiv(10),
                text("Create new Account", 18),
                forms(
                  "First name",
                  firstName,
                  (value) => null,
                ),
                forms(
                  "Last name",
                  lastName,
                  (value) => null,
                ),
                forms(
                  "Store name",
                  storeName,
                  (value) => null,
                ),
                forms(
                  "City",
                  cityName,
                  (value) => null,
                ),
                forms(
                  "Add location",
                  location,
                  (value) => null,
                ),
                forms(
                  "Email",
                  email,
                  (value) => null,
                ),
                forms(
                  "Phone no",
                  phoneNumber,
                  (value) => null,
                ),
                forms(
                  "Password",
                  password,
                  (value) => null,
                ),
                forms(
                  "Confirm Password",
                  conformPassword,
                  (value) => null,
                ),
                columDiv(20),
                submitButton(onPressed: () {}, buttonText: "Submit")
              ]),
        ),
      ),
    );
  }
}
