import 'package:flutter/material.dart';
import 'package:showp_owner_app/helpers/const.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final storeName = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var isKeybordVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: padding,
          child: Column(children: <Widget>[
            SizedBox(
              height: !isKeybordVisible ? 400 : 150,
              child: !isKeybordVisible
                  ? Image(
                      image: AssetImage(loginImage),
                      fit: BoxFit.cover,
                    )
                  : Image(
                      image: AssetImage(loginImage2),
                      fit: BoxFit.cover,
                    ),
            ),
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
              onPressed: () {},
              buttonText: "Submit",
            )
          ]),
        ));
  }
}
