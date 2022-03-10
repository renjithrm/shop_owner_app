import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  int index = 0;
  String value = "Kg";
  String itemDate = "month";
  bool isloginOrSignin = true;
  toggleScreens() {
    isloginOrSignin = !isloginOrSignin;
    update(["toggle"]);
  }
}
