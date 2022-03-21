import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/api_controller.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/authentication/login_screen.dart';
import 'package:showp_owner_app/view/authentication/signin_screen.dart';

class WarperAuth extends StatelessWidget {
  WarperAuth({Key? key}) : super(key: key);
  final _controller = Get.find<Controller>();
  final _apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    var isKeybordVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    // print(isKeybordVisible);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [
            IconButton(
              onPressed: () async {},
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: GetBuilder<Controller>(
          id: "toggle",
          builder: (_) {
            return _controller.isloginOrSignin
                ? LoginScreen(isKeybordVisible: isKeybordVisible)
                : SignInScreen();
          },
        ));
  }
}
