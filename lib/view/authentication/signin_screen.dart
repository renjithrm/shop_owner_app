import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showp_owner_app/controller/api_controller.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/controller/get_location_controller.dart';
import 'package:showp_owner_app/helpers/const.dart';

import 'package:showp_owner_app/services/shared_preference.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final firstName = TextEditingController();

  final lastName = TextEditingController();

  final storeName = TextEditingController();

  final cityName = TextEditingController();

  final location = TextEditingController();

  final email = TextEditingController();

  final phoneNumber = TextEditingController();

  final password = TextEditingController();

  final conformPassword = TextEditingController();

  final result = TextEditingController();

  final _controller = Get.find<Controller>();

  final _formKey = GlobalKey<FormState>();

  final _apiController = Get.find<ApiController>();
  final _getUserLocation = Get.put(GetUserLocation());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: padding,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          titleText("Sell your Products on Dunzo"),
          columDiv(10),
          text("Create new Account", 18),
          columDiv(10),
          profileImage(),
          columDiv(20),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                forms(
                  "First name",
                  firstName,
                  validator: requriedValidation,
                ),
                forms(
                  "Last name",
                  lastName,
                  validator: requriedValidation,
                ),
                forms(
                  "Store name",
                  storeName,
                  validator: requriedValidation,
                ),
                forms(
                  "City",
                  cityName,
                  validator: requriedValidation,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: forms(
                        "address",
                        location,
                        validator: requriedValidation,
                        onChanged: (value) {},
                      ),
                    ),
                    Expanded(
                      child: Card(
                          color: Colors.white54,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          child: TextButton.icon(
                              onPressed: () async {
                                await _getUserLocation.getUserLocation();
                                if (_getUserLocation.position != null) {
                                  print("not null");
                                }
                              },
                              icon: const FaIcon(
                                Icons.location_on,
                              ),
                              label: const LimitedBox(
                                  child: Text("Add location")))),
                    ),
                  ],
                ),
                forms("Email", email,
                    validator: MultiValidator([
                      requriedValidation,
                      EmailValidator(errorText: "Enter valid email address"),
                    ])),
                forms("Phone no", phoneNumber,
                    validator: MultiValidator([
                      requriedValidation,
                      MinLengthValidator(10,
                          errorText: "Enter valid phone number")
                    ]),
                    keyboardType: TextInputType.phone),
                GetBuilder<Controller>(
                  id: "passIcon",
                  builder: (_) {
                    return SizedBox(
                      height: 90,
                      child: forms("Password", password,
                          validator: MultiValidator([
                            requriedValidation,
                            MinLengthValidator(
                              5,
                              errorText: "Min 5 letter requried",
                            )
                          ]),
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
                            ),
                          )),
                    );
                  },
                ),
                forms(
                  "Confirm Password",
                  conformPassword,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return MatchValidator(errorText: "Mismatch password")
                          .validateMatch(value, password.text);
                    } else if (value.isEmpty) {
                      return "Confirm your password";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
              ],
            ),
          ),
          columDiv(20),
          submitButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var response = await _apiController.storeSignIn(
                      firstname: firstName.text,
                      lastname: lastName.text,
                      storename: storeName.text,
                      cityname: cityName.text,
                      latitude: Get.find<GetUserLocation>().position!.latitude,
                      logitude: Get.find<GetUserLocation>().position!.longitude,
                      address: location.text,
                      email: email.text,
                      phonenumber: phoneNumber.text,
                      password: password.text);

                  if (_apiController.storeResponseSignIn != null) {
                    print("response not null");
                    await SaveId.saveId(response!.id.toString());
                    Navigator.of(context).pushReplacementNamed("/home");
                  } else {
                    print("response is null");
                  }
                } else {
                  print("not");
                }
              },
              buttonText: "Submit"),
          TextButton(
            onPressed: () {
              Get.find<Controller>().toggleScreens();
            },
            child: const Text("Already have an acount"),
          )
        ]),
      ),
    );
  }

  Widget profileImage() {
    return Stack(
      children: [
        _controller.profilePic == null
            ? CircleAvatar(
                backgroundColor: Colors.grey[350],
                radius: 70,
                backgroundImage: AssetImage(signInImage))
            : CircleAvatar(
                backgroundColor: Colors.grey[350],
                radius: 60,
                backgroundImage: FileImage(_controller.profileImage!),
              ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
               showBottomSheets(
                onTapCamera: () {
                  _controller.takeProfilePic(ImageSource.camera);
                },
                onTapGallery: () {
                  _controller.takeProfilePic(ImageSource.gallery);
                },
              );
            },
            icon: const FaIcon(FontAwesomeIcons.camera),
          ),
        )
      ],
    );
  }
}
