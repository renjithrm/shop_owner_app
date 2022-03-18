import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/controller/api_controller.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/widgets/loading.dart';

class LoginScreen extends StatefulWidget {
  bool isKeybordVisible;
  LoginScreen({Key? key, required this.isKeybordVisible}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _apiController = Get.find<ApiController>();
  final email = TextEditingController();

  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return _apiController.isLoading
        ? const Loading()
        : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: padding,
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                SizedBox(
                    height: !widget.isKeybordVisible ? 300 : 50,
                    child: !widget.isKeybordVisible
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
                  "Email",
                  email,
                  validator: MultiValidator([
                    requriedValidation,
                    EmailValidator(errorText: "Enter valid email"),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                GetBuilder<Controller>(
                    id: "passIcon",
                    builder: (_controller) {
                      return Container(
                        height: 90,
                        child: forms("Password", password,
                            validator: requriedValidation,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _controller.obscureText,
                            suffix: IconButton(
                              onPressed: () {
                                _controller.changeVisiblity();
                              },
                              icon: FaIcon(
                                _controller.obscureText
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                size: 20,
                                color: Colors.black,
                              ),
                            )),
                      );
                    }),
                columDiv(10),
                columDiv(20),
                submitButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _apiController.storeLogin(
                          email.text, password.text);
                      if (_apiController.loginResponse != null) {
                        print(_apiController.loginResponse);
                        print("log in response not null");
                        Navigator.pushReplacementNamed(context, "/home");
                      } else {
                        print("login response null");
                      }
                    }
                  },
                  buttonText: "Submit",
                ),
                TextButton(
                    onPressed: () {
                      Get.find<Controller>().toggleScreens();
                    },
                    child: const Text("Create an acount"))
              ]),
            ),
          );
  }
}
