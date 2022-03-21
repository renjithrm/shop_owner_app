import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showp_owner_app/models/image_model.dart';

class Controller extends GetxController {
  int index = 0;
  String value = "Kg";
  String itemDate = "month";
  String? itemscategorys;
  bool isloginOrSignin = true;
  bool isVisible = true;
  final _picker = ImagePicker();
  File? image;
  var imageList = <ImageModel>[];
  //sent to api
  String? profilePic;
  //display in phone
  File? profileImage;
  bool obscureText = true;
  changeVisiblity() {
    obscureText = !obscureText;
    update(["passIcon"]);
  }

  toggleScreens() {
    isloginOrSignin = !isloginOrSignin;
    update(["toggle"]);
  }

  //pick image
  pickImage(ImageSource source) async {
    var img = await _picker.pickImage(source: source);
    if (img == null) return;
    image = File(img.path);
    imageList.add(ImageModel(image: image!));

    update(["image"]);
  }

  takeProfilePic(ImageSource source) async {
    try {
      var image = await _picker.pickImage(source: source);
      if (image != null) {
        profileImage = File(image.path);
        var pic = profileImage!.readAsBytesSync();

        profilePic = base64Encode(pic);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> convertImage(File image) async {
    var productImage = image.readAsBytesSync();
    var baseImage = base64Encode(productImage);

    return baseImage;
  }
}
